class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :user_uid, null: false
      t.integer :task_type_id, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
