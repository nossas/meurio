class User < ActiveRecord::Base
  has_many :activities
  has_many :task_subscriptions
  has_many :rewards
  has_many :achievements
  has_many :badges, through: :achievements
  scope :admins, -> { where(admin: true) }
  scope :funders, -> { where(funder: true) }

  def name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    if self.avatar
      "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
    else
      "http://i.imgur.com/lsAFCHL.jpg"
    end
  end

  def score_in_task_type task_type_id
    self.rewards.where(task_type_id: task_type_id).sum(:points)
  end

  def earn_badge badge
    unless self.badges.include? badge
      self.badges << badge
      MeurioMailer.delay.you_earned_a_badge(self, badge)
    end
  end

  def last_badge
    self.last_badges.first if self.badges.any?
  end

  def last_badges
    self.achievements.first(9).collect(&:badge) if self.badges.any?
  end
end
