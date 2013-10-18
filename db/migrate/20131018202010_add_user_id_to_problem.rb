class AddUserIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :user_id, :integer
  end
end
