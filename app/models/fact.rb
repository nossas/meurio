class Fact < ActiveRecord::Base
  has_one :mobilization, primary_key: :hashtag, foreign_key: :hashtag

  attr_accessor :app
  after_initialize :define_app

  def define_app
    if relname == 'campaigns'
      self.app = :pdp
    elsif relname == 'problems'
      self.app = :imagine
    elsif relname == 'events'
      self.app = :fb
    end
  end
end
