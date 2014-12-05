class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  def pending?
    Delivery.where(user_id: self.user_id, task_id: self.task_id).empty? && !self.task.expired?
  end

  def awaiting_validation?
    self.deliveries.where("accepted_at IS NULL AND rejected_at IS NULL").any?
  end

  def late?
    self.task.expired? && self.deliveries.where("accepted_at IS NOT NULL").empty?
  end

  def accepted?
    self.deliveries.where("accepted_at IS NOT NULL").any?
  end

  def external_url
    "#{ENV['MULTITUDE_HOST']}/tasks/#{self.task.id}"
  end
end
