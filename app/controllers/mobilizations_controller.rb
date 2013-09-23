class MobilizationsController < InheritedResources::Base
  before_filter(only: :show) { @facts = Fact.where(mobilization_id: params[:id]).order("created_at DESC") }
  before_filter(only: :show) { @tweets = Tweet.where(hashtag: 'DeGuardaNoBondinho').order("published_at DESC") }
end
