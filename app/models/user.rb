class User < ActiveRecord::Base
  has_many :activities
  has_many :task_subscriptions
  has_many :rewards
  has_many :task_types, -> { uniq }, through: :rewards
  has_many :categories, -> { uniq }, through: :task_types
  has_many :achievements
  has_many :badges, through: :achievements
  has_many :successful_transactions
  has_many :panela_pokes
  has_many :panela_campaigns, -> { uniq }, through: :panela_pokes
  scope :admins, -> { where(admin: true) }
  scope :funders, -> { joins(:successful_transactions).uniq }
  scope :sponsors, -> { where(sponsor: true) }

  def name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    if self.avatar
      "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
    else
      "http://i.imgur.com/7XqAySb.png"
    end
  end

  def task_type_score task_type_ids
    self.rewards.where(task_type_id: task_type_ids).sum(:points)
  end

  def category_score category_id
    self.task_type_score Category.find(category_id).task_type_ids
  end

  def total_points
    self.rewards.sum(:points)
  end

  def earn_badge badge
    unless self.badges.include? badge
      self.badges << badge
      MeurioMailer.delay.you_earned_a_badge(self, badge)
    end
  end

  def deserve_badge_for_time?
    self.total_points >= Badge.for_volunteer_time.points if Badge.for_volunteer_time.present?
  end

  def last_badge
    self.last_badges.first if self.badges.any?
  end

  def last_badges
    self.achievements.collect(&:badge) if self.badges.any?
  end

  def self.funders_or_sponsors
    User.where("id IN (?)", User.funders.pluck(:id) + User.sponsors.pluck(:id))
  end

  def finished_tasks
    Task.
      joins("LEFT OUTER JOIN deliveries ON tasks.id = deliveries.task_id").
      joins("LEFT OUTER JOIN multitude_rewards ON tasks.id = multitude_rewards.task_id").
      where("(deliveries.user_id = ? AND deliveries.accepted_at IS NOT NULL) OR multitude_rewards.user_id = ?", id, id).
      order(:deadline).uniq
  end

  def matching_tasks
    Task.
      joins("LEFT JOIN task_subscriptions ON task_subscriptions.task_id = tasks.id").
      where("skills && ARRAY[?]::character varying[] AND task_subscriptions.id IS NULL", skills).
      order(:deadline)
  end

  def subscribed_tasks
    Task.
      joins(:task_subscriptions).
      where("task_subscriptions.user_id = ?", id).
      order(:deadline)
  end
end
