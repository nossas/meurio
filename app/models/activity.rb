class Activity < ActiveRecord::Base
  belongs_to :user
  has_one :mobilization, primary_key: :hashtag, foreign_key: :hashtag
end
