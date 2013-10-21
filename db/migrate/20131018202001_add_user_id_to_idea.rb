class AddUserIdToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :user_id, :integer
  end
end
