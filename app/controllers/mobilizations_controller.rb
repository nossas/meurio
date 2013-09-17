class MobilizationsController < InheritedResources::Base
  before_filter(only: :show) { @history = Idea.order("created_at DESC") + Campaign.order("created_at DESC") }
end
