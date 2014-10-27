class CompartilhacoTwitterProfileSpreader < ActiveRecord::Base
  belongs_to :user
  belongs_to :compartilhaco_campaign, foreign_key: :campaign_id

  def external_url
    "#{ENV['COMPARTILHACO_HOST']}/campaigns/#{self.compartilhaco_campaign.id}"
  end
end
