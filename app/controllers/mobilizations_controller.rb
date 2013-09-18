class MobilizationsController < InheritedResources::Base
  before_filter(only: :show) { @history = Problem.order("created_at DESC") + Campaign.order("created_at DESC") }
end
