class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  has_one :category, through: :task_type
  has_many :task_subscriptions
  has_many :deliveries, through: :task_subscriptions

  def self.matching skills
    Task.
      joins("LEFT JOIN task_subscriptions ON task_subscriptions.task_id = tasks.id").
      where("skills && ARRAY[?]::character varying[] AND task_subscriptions.id IS NULL", skills)
  end

  def self.finished user_id
    Task.
      joins(:task_subscriptions).
      joins(:deliveries).
      where("task_subscriptions.user_id = ? AND deliveries.task_subscription_id = task_subscriptions.id AND deliveries.accepted_at IS NOT NULL", user_id)
  end

  def self.subscribed user_id
    Task.
      joins(:task_subscriptions).
      joins("LEFT JOIN deliveries ON deliveries.task_subscription_id = task_subscriptions.id AND deliveries.accepted_at IS NOT NULL").
      where("task_subscriptions.user_id = ? AND deliveries.id IS NULL", user_id)
  end

  def expired?
    self.deadline < Time.now
  end
end
