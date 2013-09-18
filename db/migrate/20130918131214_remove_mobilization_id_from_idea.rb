class RemoveMobilizationIdFromIdea < ActiveRecord::Migration
  def self.up
    remove_column :ideas, :mobilization_id
  end
  
  def self.down
    add_column :ideas, :mobilization_id, :integer
  end
end
