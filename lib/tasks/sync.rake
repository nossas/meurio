require "httparty"

namespace :sync do
  namespace :pdp do
    task :campaigns => :environment do
      campaigns = JSON.parse(HTTParty.get("#{ENV["PDP_HOST"]}/campaigns.json").body)
      campaigns.each do |campaign|
        puts campaign["name"]
        mobilization = Mobilization.find_by_hashtag(campaign["hashtag"])
        if mobilization.present?
          Campaign.create(
            name:             campaign["name"],
            link:             "#{ENV["PDP_HOST"]}/campaigns/#{campaign["id"]}",
            description_html: campaign["description_html"],
            uid:              campaign["id"],
            mobilization:     mobilization
          )
        end
      end
    end

    task :pokes => :environment do
      Campaign.all.each do |campaign|
        pokes = JSON.parse(HTTParty.get("#{ENV["PDP_HOST"]}/campaigns/#{campaign.uid}/pokes.json").body)
        pokes.each do |poke|
          puts poke["id"]
          Poke.create(uid: poke["id"], campaign: campaign)
        end
      end
    end
  end

  namespace :imagine do
    task :problems => :environment do
      problems = JSON.parse(HTTParty.get("#{ENV["IMAGINE_HOST"]}/problems.json").body)
      problems.each do |problem_hash|
        puts "##{problem_hash['hashtag']} - #{problem_hash['title']}"
        mobilization = Mobilization.find_by(hashtag: problem_hash["hashtag"])
        if mobilization.present?
          Problem.create(
            name:             problem_hash["title"],
            link:             "#{ENV['IMAGINE_HOST']}/problems/#{problem_hash['id']}",
            description:      problem_hash["description"],
            uid:              problem_hash["id"],
            mobilization:     mobilization
          )

          problem = Problem.find_by(uid: problem_hash['id'].to_s)
          
          problem_hash['ideas'].each do |idea|
            puts idea['id']
            Idea.create(
              name:             idea["title"],
              link:             "#{ENV["IMAGINE_HOST"]}/problems/#{problem_hash['id']}/ideas/#{idea['id']}",
              description:      idea["description"],
              uid:              idea["id"],
              problem:          problem
            )
          end if problem
        end
      end
    end
  end

  namespace :facebook do
    task :images => :environment do
      images = Koala::Facebook::API.new.get_connections("241897672509479", "photos", type: "uploaded", fields: "name,source").select{|image| image["name"].present?}
      images.each do |image|
        mobilization = Mobilization.where("hashtag IN (?)", image["name"].scan(/#[\S]+/).map{|h| h.delete("#")}).first
        if mobilization.present?
          Image.create remote_file_url: image["source"], hashtag: mobilization.hashtag, uid: image["id"]
        end
      end
    end
  end
end
