class PanelaCampaign < ActiveRecord::Base
  belongs_to :user
  has_many :panela_pokes, foreign_key: :campaign_id

  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.id}"
  end
end
