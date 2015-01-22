class PanelaCampaign < ActiveRecord::Base
  belongs_to :user
  has_many :panela_pokes, foreign_key: :campaign_id

  # TODO: think about move this whole model to a gem and reuse it in PdP
  scope :successful, -> { where(succeed: true) }

  def external_url
    "#{ENV['PDP_HOST']}/campaigns/#{self.id}"
  end

  def image_url
    if Rails.env.development?
      self.image
    else
      "#{ENV['PDP_AWS_HOST']}/uploads/campaign/image/#{self.id}/#{self.image}"
    end
  end
end
