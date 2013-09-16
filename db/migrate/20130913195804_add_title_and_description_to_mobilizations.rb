class AddTitleAndDescriptionToMobilizations < ActiveRecord::Migration
  def change
    add_column :mobilizations, :title, :string
    add_column :mobilizations, :description, :text
  end
end
