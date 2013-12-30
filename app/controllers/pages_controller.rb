class PagesController < ApplicationController
  layout false

  def team
    @team = User.admins.order(:first_name)
  end

  def funders
    @funders = User.funders.limit(50).order("random()")
  end
end
