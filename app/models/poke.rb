class Poke < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  validates :uid, presence: true, uniqueness: true

  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.campaign.uid}"
  end
end
