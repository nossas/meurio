class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :task_types
  has_many :tasks, through: :task_types
end
