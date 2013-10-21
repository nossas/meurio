class AddUserEmailToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :user_email, :string
  end
end
