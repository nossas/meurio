class Campaign < ActiveRecord::Base
  validates :name, :link, :description, :mobilization_id, presence: true
  belongs_to :mobilization
end
