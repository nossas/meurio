class PanelaCampaign < ActiveRecord::Base
  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.id}"
  end
end
