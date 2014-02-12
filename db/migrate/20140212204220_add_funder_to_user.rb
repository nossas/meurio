class AddFunderToUser < ActiveRecord::Migration
  def change
    add_column :users, :funder, :boolean
  end
end
