class Delivery < ActiveRecord::Base
  belongs_to :task_subscription

  def external_url
    "#{ENV['MULTITUDE_HOST']}/tasks/#{self.task_subscription.task.id}"
  end
end
