class Fact < ActiveRecord::Base
  has_one :mobilization, primary_key: :hashtag, foreign_key: :hashtag

  attr_accessor :app
  after_initialize :define_app

  def define_app
    if relname == 'problems'
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

  def external_link
    if relname == 'panela_campaigns'
      PanelaCampaign.find(self.id).try(:external_url)
    elsif relname == 'compartilhaco_campaigns'
      CompartilhacoCampaign.find(self.id).try(:external_url)
    else
      self.link
    end
  end
end
