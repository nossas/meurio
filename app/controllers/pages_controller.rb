class PagesController < ApplicationController
  layout false

  def team
    @team = User.admins.order(:first_name)
  end

  def funders
  end
end
