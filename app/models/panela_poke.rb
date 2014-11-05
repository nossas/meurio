class PanelaPoke < ActiveRecord::Base
  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.campaign_id}"
  end
end
