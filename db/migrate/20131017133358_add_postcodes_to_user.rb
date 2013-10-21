class AddPostcodesToUser < ActiveRecord::Migration
  def change
    add_column :users, :home_postcode, :string
    add_column :users, :work_postcode, :string
  end
end
