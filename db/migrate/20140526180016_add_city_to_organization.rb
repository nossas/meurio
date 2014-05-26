class AddCityToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :city, :string
  end
end
