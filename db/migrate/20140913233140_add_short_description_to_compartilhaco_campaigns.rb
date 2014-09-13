class AddShortDescriptionToCompartilhacoCampaigns < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :short_description, :text
  end
end
