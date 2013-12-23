class PagesController < ApplicationController
  layout false

  def team
    @team = User.admins
  end

  def funders
  end
end
