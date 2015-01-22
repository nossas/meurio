class AddFinishedAtToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :finished_at, :datetime
  end
end
