class AddDescriptionHtmlToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :description_html, :text
  end
end
