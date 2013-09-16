class MobilizationsController < InheritedResources::Base
  before_filter(only: :show) { @history = Campaign.order("created_at DESC") }
end
