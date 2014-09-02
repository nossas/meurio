class AddTerritorialToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :territorial, :boolean
  end
end
