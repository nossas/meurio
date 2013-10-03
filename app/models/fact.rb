class Fact < ActiveRecord::Base
  has_one :mobilization, primary_key: :hashtag, foreign_key: :hashtag

  attr_accessor :counter, :caption
  after_initialize :update_counter

  def update_counter
    if relname == 'campaigns'
      self.counter = mobilization.pokes.count
      self.caption = 'pokers'
    elsif relname == 'problems'
      self.counter = mobilization.ideas.count
      self.caption = 'ideas'
    elsif relname == 'events'
      self.counter = mobilization.attending_count
      self.caption = 'attending'
    end
  end
end
