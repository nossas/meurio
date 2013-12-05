class RemoveWorkColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :work_postcode, :string
    remove_column :users, :work_address_street, :string
    remove_column :users, :work_address_number, :string
    remove_column :users, :work_address_extra, :string
    remove_column :users, :work_address_district, :string
    remove_column :users, :work_city, :string
    remove_column :users, :work_state, :string
  end
end
