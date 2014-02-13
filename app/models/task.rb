class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  has_one :category, through: :task_type
  has_many :task_subscriptions

  def self.matching skills
    Task.where("skills && ARRAY[?]::character varying[]", skills)
  end

  def expired?
    self.deadline.present? ? self.deadline < Time.now : false
  end
end
