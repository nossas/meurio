class AddCreatedAtToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :created_at, :datetime
  end
end
