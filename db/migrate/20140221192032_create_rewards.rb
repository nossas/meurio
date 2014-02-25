class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :user_id, null: false, foreign_key: false
      t.integer :task_type_id, null: false
      t.integer :points, null: false
      t.string :source_app, null: false
      t.string :source_model, null: false
      t.integer :source_id, null: false, foreign_key: false

      t.timestamps
    end
  end
end
