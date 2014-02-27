class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id, null: false
      t.integer :badge_id, null: false

      t.timestamps
    end
    add_index :achievements, [:badge_id, :user_id], unique: true
  end
end
