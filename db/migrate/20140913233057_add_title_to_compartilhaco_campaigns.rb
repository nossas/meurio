class AddTitleToCompartilhacoCampaigns < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :title, :string
  end
end
