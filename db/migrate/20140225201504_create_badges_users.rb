class CreateBadgesUsers < ActiveRecord::Migration
  def change
    create_table :badges_users, id: false do |t|
      t.references :badge
      t.references :user
    end
    add_index :badges_users, [:badge_id, :user_id], unique: true
  end
end
