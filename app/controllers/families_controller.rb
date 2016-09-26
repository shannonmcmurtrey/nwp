class FamiliesController < ApplicationController
  def new
  	@family = Family.new
  end
end
