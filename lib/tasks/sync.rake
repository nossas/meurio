require "httparty"

namespace :sync do
  namespace :pdp do
    task :campaigns => :environment do
      campaigns = JSON.parse(HTTParty.get("#{ENV["PANELADEPRESSAO_HOST"]}/campaigns.json").body)
      campaigns.each do |campaign|
        puts campaign["name"]
        mobilization = Mobilization.find_by_hashtag(campaign["hashtag"])
        if mobilization.present?
          Campaign.create(
            name:             campaign["name"],
            link:             "#{ENV["PANELADEPRESSAO_HOST"]}/campaigns/#{campaign["id"]}",
            description_html: campaign["description_html"],
            uid:              campaign["id"],
            mobilization:     mobilization
          )
        end
      end
    end

    task :pokes => :environment do
      Campaign.all.each do |campaign|
        pokes = JSON.parse(HTTParty.get("#{ENV["PANELADEPRESSAO_HOST"]}/campaigns/#{campaign.uid}/pokes.json").body)
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
      problems.each do |problem|
        puts problem["title"]
        mobilization = Mobilization.find_by_hashtag(problem["hashtag"])
        if mobilization.present?
          Problem.create(
            name:             problem["title"],
            link:             "#{ENV["PDP_HOST"]}/problems/#{problem["id"]}",
            description_html: problem["description"],
            uid:              problem["id"],
            mobilization:     mobilization
          )
        end
      end
    end
  end
end
