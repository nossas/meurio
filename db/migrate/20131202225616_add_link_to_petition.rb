class AddLinkToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :link, :string
  end
end
