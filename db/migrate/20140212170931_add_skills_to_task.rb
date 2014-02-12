class AddSkillsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :skills, :string, array: true
  end
end
