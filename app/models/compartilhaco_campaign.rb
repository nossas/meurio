class CompartilhacoCampaign < ActiveRecord::Base
  belongs_to :user

  def external_url
    "#{ENV['COMPARTILHACO_HOST']}/campaigns/#{self.id}"
  end
end
