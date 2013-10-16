class AddUserEmailToPoke < ActiveRecord::Migration
  def change
    add_column :pokes, :user_email, :string
  end
end
