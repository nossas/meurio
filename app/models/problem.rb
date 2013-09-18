class Problem < ActiveRecord::Base
  validates :name, :link, :description, :mobilization_id, presence: true
  belongs_to :mobilization
  has_many :ideas
end
