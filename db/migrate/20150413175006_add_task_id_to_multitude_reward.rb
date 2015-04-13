class AddTaskIdToMultitudeReward < ActiveRecord::Migration
  def change
    add_column :multitude_rewards, :task_id, :integer
  end
end
