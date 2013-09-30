class AddShortTitleToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :short_title, :string
  end
end
