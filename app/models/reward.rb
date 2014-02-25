class Reward < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type
  validates :user_id, :task_type_id, :points, :source_app, :source_model, :source_id, presence: true
  validates :source_app, uniqueness: { scope: [:source_model, :source_id] }

  after_create :grant_badges

  private
  def grant_badges
    possible_badges = TaskType.find(self.task_type_id).badges
    score = self.user.score_in_task_type(self.task_type_id)
    
    possible_badges.each do |badge|
      self.user.earn_badge(badge) if score > badge.points
    end
  end
end
