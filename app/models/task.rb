class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  belongs_to :organization
  has_one :category, through: :task_type
  has_many :task_subscriptions
  has_many :deliveries

  def expired?
    self.deadline < Time.current
  end
end
