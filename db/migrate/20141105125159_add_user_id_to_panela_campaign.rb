class AddUserIdToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :user_id, :integer
  end
end
