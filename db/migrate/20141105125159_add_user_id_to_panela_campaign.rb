class AddUserIdToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :user_id, :integer, foreign_key: false
  end
end
