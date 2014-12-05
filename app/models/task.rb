class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  belongs_to :organization
  has_one :category, through: :task_type
  has_many :task_subscriptions
  has_many :deliveries

  def self.matching skills
    Task.
      joins("LEFT JOIN task_subscriptions ON task_subscriptions.task_id = tasks.id").
      where("skills && ARRAY[?]::character varying[] AND task_subscriptions.id IS NULL", skills).
      order(:deadline)
  end

  def self.finished user_id
    Task.
      joins(:deliveries).
      where("deliveries.user_id = ? AND deliveries.accepted_at IS NOT NULL", user_id).
      order(:deadline)
  end

  def self.subscribed user_id
    Task.
      joins(:task_subscriptions).
      where("task_subscriptions.user_id = ?", user_id).
      order(:deadline)
  end

  def expired?
    self.deadline < Time.current
  end
end
