class AddSignaturesCountToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :signatures_count, :integer
  end
end
