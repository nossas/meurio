class RemoveHomeAddressNumberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :home_address_number, :string
  end
end
