class Poke < ActiveRecord::Base
  belongs_to :campaign
  validates :uid, presence: true, uniqueness: true
end
