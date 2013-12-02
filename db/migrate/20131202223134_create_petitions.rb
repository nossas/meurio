class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|

      t.timestamps
    end
  end
end
