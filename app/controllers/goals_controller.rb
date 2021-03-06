class GoalsController < ApplicationController
  before_action :verify_is_admin
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @individual = Individual.find(params[:individual_id])
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    @individual = @goal.individual
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @individual = @goal.individual


    respond_to do |format|
      if @goal.save
        format.html { redirect_to @individual, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @individual = @goal.individual
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @individual, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @individual = @goal.individual
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to @individual, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:individual_id, :goal, :goal_start, :goal_finish, :completion_percentage)
    end
     def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
