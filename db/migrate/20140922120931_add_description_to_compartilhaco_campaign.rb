class AddDescriptionToCompartilhacoCampaign < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :description, :text
  end
end
