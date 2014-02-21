class Reward < ActiveRecord::Base
  validates :user_id, :task_type_id, :points, presence: true
end
