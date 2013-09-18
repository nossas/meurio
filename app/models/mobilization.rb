class Mobilization < ActiveRecord::Base
  has_many :campaigns
  has_many :problems
end
