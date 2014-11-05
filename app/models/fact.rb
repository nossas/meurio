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
      self.app = :eventos
    elsif relname == 'petitions'
      self.app = :petitions
    elsif relname == 'compartilhaco_campaigns'
      self.app = :compartilhaco
    elsif relname == 'panela_campaigns'
      self.app = :pdp
    end
  end
end
