class Delivery < ActiveRecord::Base
  belongs_to :task_subscription
end
