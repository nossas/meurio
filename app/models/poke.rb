class Poke < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  validates :uid, presence: true, uniqueness: true
end
