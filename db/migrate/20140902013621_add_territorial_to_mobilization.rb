class AddTerritorialToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :territorial, :boolean, default: false
  end
end
