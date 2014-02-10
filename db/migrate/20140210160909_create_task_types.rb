class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name, null: false
      t.integer :points, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
