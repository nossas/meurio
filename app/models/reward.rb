class Reward < ActiveRecord::Base
  validates :user_uid, :task_type_id, :points, presence: true
end
