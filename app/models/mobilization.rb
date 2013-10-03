class Mobilization < ActiveRecord::Base
  has_many :campaigns, primary_key: :hashtag, foreign_key: :hashtag
  has_many :problems, primary_key: :hashtag, foreign_key: :hashtag
  has_many :pokes, through: :campaigns
  has_many :ideas, through: :problems
  has_many :images, primary_key: :hashtag, foreign_key: :hashtag
  has_many :facts, primary_key: :hashtag, foreign_key: :hashtag
  has_many :comments, primary_key: :hashtag, foreign_key: :hashtag
  has_many :events, primary_key: :hashtag, foreign_key: :hashtag

  mount_uploader :image, MobilizationUploader

  validates_presence_of :title, :short_title, :hashtag, :description
  validates_presence_of :image, on: :create

  def share_count
    self.comments.sum(:share_count) + self.comments.sum(:like_count)
  end

  def attending_count
    self.events.sum(:attending_count)
  end

  def action_of_the_day
    self.facts.first
  end
end
