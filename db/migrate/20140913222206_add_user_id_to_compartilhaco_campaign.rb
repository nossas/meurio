class AddUserIdToCompartilhacoCampaign < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :user_id, :integer, foreign_key: false
  end
end
