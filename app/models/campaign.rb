class Campaign < ActiveRecord::Base
  validates :name, :link, :description_html, :hashtag, presence: true
  validates :uid, uniqueness: true
  belongs_to :mobilization, foreign_key: :hashtag, primary_key: :hashtag
  belongs_to :user
  has_many :pokes

  before_save { self.description_html.gsub!('&quot;', '"') if self.description_html }

  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.uid}"
  end
end
