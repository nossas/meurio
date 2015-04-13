class AddUserIdToMultitudeReward < ActiveRecord::Migration
  def change
    add_column :multitude_rewards, :user_id, :integer
  end
end
