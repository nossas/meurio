class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :mobilization, foreign_key: :hashtag
end
