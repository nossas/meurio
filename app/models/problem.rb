class Problem < ActiveRecord::Base
  validates :name, :link, :description, :mobilization_id, presence: true
  validates :uid, uniqueness: true
  belongs_to :mobilization
  has_many :ideas
end
