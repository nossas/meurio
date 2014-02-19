class CreateBadgesTaskTypes < ActiveRecord::Migration
  def change
    create_table :badges_task_types, id: false do |t|
      t.references :badge
      t.references :task_type
    end
    add_index :badges_task_types, [:badge_id, :task_type_id], unique: true
  end
end
