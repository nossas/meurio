class AddUserIdToPoke < ActiveRecord::Migration
  def change
    add_column :pokes, :user_id, :integer
  end
end
