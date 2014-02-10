class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :task_types
  has_many :tasks, through: :task_types

  def self.score user_id
    Category.
      select("categories.id, categories.name, sum(t.points) AS score").
      joins("INNER JOIN task_types tt ON tt.category_id = categories.id").
      joins("INNER JOIN tasks t ON t.task_type_id = tt.id").
      joins("INNER JOIN task_subscriptions ts ON ts.task_id = t.id").
      joins("INNER JOIN deliveries d ON d.task_subscription_id = ts.id").
      where("d.accepted_at IS NOT NULL AND ts.user_id = ?", user_id).
      group("categories.id").
      order("score")
  end
end
