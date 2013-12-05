class RemoveHomeAddressExtraFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :home_address_extra, :string
  end
end
