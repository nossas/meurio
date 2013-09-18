class Problem < ActiveRecord::Base
  belongs_to :mobilization
  has_many :ideas
end
