class FamiliesController < ApplicationController
  def new
  	@family = Family.new
  end

  def index
  	@families = Family.all
  end

  def create
  	@family = Family.new(user_params)
  	if @family.save
  		flash[:success] = "Family information saved."
  		redirect_to @family
  	else
  	  render 'new'
  	end
  end

  def show	
  	@family = Family.find(params[:id])
  end

end

private
  
  def user_params
  	  params.require(:family).permit(:name, :address, :city)
  end