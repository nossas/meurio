class MobilizationsController < InheritedResources::Base
  before_filter(only: :show) { @facts = Fact.where(mobilization_id: params[:id]).order("created_at DESC") }
end
