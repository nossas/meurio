class Idea < ActiveRecord::Base
  validates :name, :link, :description, :problem_id, presence: true
  validates :uid, uniqueness: true
  belongs_to :problem
  belongs_to :user

  def external_url
    "#{ENV['PDP_HOST']}/problems/#{self.problem.uid}/ideas/#{self.uid}"
  end
end
