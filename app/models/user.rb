class User < ActiveRecord::Base
  has_many :activities
  has_many :task_subscriptions
  has_many :rewards
  has_and_belongs_to_many :badges
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
    self.badges.order(:created_at).last if self.badges.any?
  end

  def last_badges
    self.badges.order('created_at DESC').first(9)
  end
end
