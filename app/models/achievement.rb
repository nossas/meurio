class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge

  default_scope { order('created_at DESC') }
end
