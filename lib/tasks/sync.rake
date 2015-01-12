require "httparty"

namespace :sync do
  namespace :imagine do
    task :problems => :environment do
      problems = JSON.parse(HTTParty.get("#{ENV["IMAGINE_HOST"]}/problems.json?token=#{ENV["IMAGINE_API_TOKEN"]}").body)
      problems.each do |problem_hash|
        mobilization = Mobilization.find_by(hashtag: problem_hash["hashtag"])
        if mobilization.present?
          Problem.create(
            name:             problem_hash["title"],
            link:             "#{ENV['IMAGINE_HOST']}/problems/#{problem_hash['id']}",
            description:      problem_hash["description"],
            uid:              problem_hash["id"],
            hashtag:          mobilization.hashtag,
            user:             User.find_by_email(problem_hash["user"]["email"]),
            user_email:       problem_hash["user"]["email"]
          )

          problem = Problem.find_by(uid: problem_hash['id'].to_s)

          problem_hash['ideas'].each do |idea|
            Idea.create(
              name:             idea["title"],
              link:             "#{ENV["IMAGINE_HOST"]}/problems/#{problem_hash['id']}/ideas/#{idea['id']}",
              description:      idea["description"],
              uid:              idea["id"],
              problem:          problem,
              user:             User.find_by_email(idea["user"]["email"]),
              user_email:       idea["user"]["email"]
            )
          end if problem
        end
      end
    end
  end

  namespace :twitter do
    task :tweets => :environment do
      Mobilization.all.each do |mobilization|
        Twitter.search(mobilization.hashtag, result_type: 'recent').results.map do |tweet|
          Tweet.create(
            hashtag:      mobilization.hashtag,
            username:     tweet.from_user,
            text:         tweet.text,
            uid:          tweet.id,
            published_at: tweet.created_at
          )
        end
      end
    end

    task :favorites_and_retweets => :environment do
      Tweet.where("created_at >= ?", Time.current - 1.day).all.each do |tweet|
        status = Twitter.status(tweet.uid)
        tweet.update_attributes favorite_count: status.favourites_count, retweet_count: status.retweet_count
      end
    end
  end

  namespace :facebook do
    task :images_and_clippings => :environment do
      Organization.all.each do |organization|
        organization.fetch_images_and_clippings_from_facebook
      end
    end

    task :posts_by_hashtag => :environment do
      Rails.logger.info "Fetching posts by hashtag from Facebook..."
      graph = Koala::Facebook::API.new(ENV["FB_APP_TOKEN"])
      
      Mobilization.all.each do |mobilization|
        begin
          posts = graph.search(mobilization.hashtag, fields: "from,message,created_time,id")
          Rails.logger.info "Posts found for mobilization #{mobilization.id}: #{posts.count}"

          posts.each do |post|
            FacebookPost.create(
              hashtag:      mobilization.hashtag,
              username:     post["from"]["name"],
              text:         post["message"],
              published_at: post["created_time"],
              user_uid:     post["from"]["id"],
              uid:          post["id"]
            )
          end

          Rails.logger.info "...Done!"
        rescue Exception => e
          Appsignal.add_exception e
          Rails.logger.info "Could not update Mobilization #{mobilization.id}"
          Rails.logger.info e.message
        end
      end
    end

    task :posts_by_organization, [:limit] => :environment do |t, args|
      Organization.all.each do |organization|
        organization.fetch_posts_from_facebook args[:limit]        
      end
    end

    task :likes_shares_and_comments => :environment do
      Organization.all.each do |organization|
        organization.fetch_likes_shares_and_comments_from_facebook
      end
    end

    task :events => :environment do
      Organization.all.each do |organization|
        organization.fetch_events_from_facebook
      end
    end

    task :attendees => :environment do
      graph = Koala::Facebook::API.new(ENV["FB_APP_TOKEN"])
      Event.all.each do |event|
        attending_count = graph.fql_query("SELECT attending_count FROM event WHERE eid = #{event.uid}").first["attending_count"]
        event.update_attributes attending_count: attending_count
      end
    end
  end
end
