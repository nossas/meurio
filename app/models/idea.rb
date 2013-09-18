class Idea < ActiveRecord::Base
  validates :name, :link, :description, :problem_id, presence: true
  validates :uid, uniqueness: true
  belongs_to :problem
end
