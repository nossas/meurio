class AddFieldsToTask < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      add_column :tasks, :task_type_id, :integer
      add_column :tasks, :points, :integer, null: false
      add_column :tasks, :skills, :string, array: true
      add_column :tasks, :title, :string
      add_column :tasks, :hashtag, :string
      add_column :tasks, :max_deliveries, :integer
      add_column :tasks, :deadline, :datetime
    end
  end
end
