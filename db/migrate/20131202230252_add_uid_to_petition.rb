class AddUidToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :uid, :string
  end
end
