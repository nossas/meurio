class AddAddressFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :home_address_street, :string
    add_column :users, :home_address_number, :string
    add_column :users, :home_address_extra, :string
    add_column :users, :home_address_district, :string
    add_column :users, :home_city, :string
    add_column :users, :home_state, :string
    add_column :users, :work_address_street, :string
    add_column :users, :work_address_number, :string
    add_column :users, :work_address_extra, :string
    add_column :users, :work_address_district, :string
    add_column :users, :work_city, :string
    add_column :users, :work_state, :string
  end
end
