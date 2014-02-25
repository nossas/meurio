class Reward < ActiveRecord::Base
  validates :user_id, :task_type_id, :points, :source_app, :source_model, :source_id, presence: true
  validates :source_app, uniqueness: { scope: [:source_model, :source_id] }
end
