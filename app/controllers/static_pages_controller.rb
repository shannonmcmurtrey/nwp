class StaticPagesController < ApplicationController
  def home
  	unless current_user.individual.nil?
  	  @individual = current_user.individual
  	  redirect_to @individual
    else
      render static_pages_home_path
  	end
  end

  def assistance
  end

  def reports
  end
end
