class AddUserEmailToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :user_email, :string
  end
end
