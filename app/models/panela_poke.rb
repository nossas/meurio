class PanelaPoke < ActiveRecord::Base
  belongs_to :user
  belongs_to :panela_campaign, foreign_key: "campaign_id"

  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.campaign_id}"
  end
end
