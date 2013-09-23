class Mobilization < ActiveRecord::Base
  has_many :campaigns
  has_many :problems
  has_many :pokes, through: :campaigns
  has_many :ideas, through: :problems
end
