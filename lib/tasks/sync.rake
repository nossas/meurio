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
  end
end
