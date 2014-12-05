class Delivery < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  def external_url
    "#{ENV['MULTITUDE_HOST']}/tasks/#{self.task.id}"
  end
end
