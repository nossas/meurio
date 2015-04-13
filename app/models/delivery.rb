class Delivery < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  scope :accepted, -> { where("accepted_at IS NOT NULL") }

  def external_url
    "#{ENV['MULTITUDE_HOST']}/tasks/#{self.task.id}"
  end
end
