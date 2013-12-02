class AddHashtagToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :hashtag, :string
  end
end
