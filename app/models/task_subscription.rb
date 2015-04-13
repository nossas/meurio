class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  def pending?
    Delivery.where(user_id: self.user_id, task_id: self.task_id).empty? && !self.task.expired?
  end

  def awaiting_validation?
    Delivery.
      where(user_id: self.user_id).
      where(task_id: self.task_id).
      where("accepted_at IS NULL AND rejected_at IS NULL").
      any?
  end

  def deliveries
    Delivery.
      where(user_id: self.user_id).
      where(task_id: self.task_id)
  end

  def rewards
    MultitudeReward.
      where(user_id: self.user_id).
      where(task_id: self.task_id)
  end

  def late?
    if !task.expired? || deliveries.accepted.any? || rewards.any?
      false
    else
      true
    end
  end

  def accepted?
    deliveries.accepted.any? || rewards.any?
  end

  def external_url
    "#{ENV['MULTITUDE_HOST']}/tasks/#{self.task.id}"
  end
end
