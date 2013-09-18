class AddProblemIdToIdea < ActiveRecord::Migration
  def change
    add_reference :ideas, :problem, index: true
  end
end
