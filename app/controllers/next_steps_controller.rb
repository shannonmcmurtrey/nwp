class NextStepsController < ApplicationController
  before_action :verify_is_admin
  before_action :set_next_step, only: [:show, :edit, :update, :destroy]

  # GET /next_steps
  # GET /next_steps.json
  def index
    @next_steps = NextStep.all
  end

  # GET /next_steps/1
  # GET /next_steps/1.json
  def show
  end

  # GET /next_steps/new
  def new
    @next_step = NextStep.new
  end

  # GET /next_steps/1/edit
  def edit
  end

  # POST /next_steps
  # POST /next_steps.json
  def create
    @next_step = NextStep.new(next_step_params)

    respond_to do |format|
      if @next_step.save
        format.html { redirect_to @next_step, notice: 'Next step was successfully created.' }
        format.json { render :show, status: :created, location: @next_step }
      else
        format.html { render :new }
        format.json { render json: @next_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /next_steps/1
  # PATCH/PUT /next_steps/1.json
  def update
    respond_to do |format|
      if @next_step.update(next_step_params)
        format.html { redirect_to @next_step, notice: 'Next step was successfully updated.' }
        format.json { render :show, status: :ok, location: @next_step }
      else
        format.html { render :edit }
        format.json { render json: @next_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /next_steps/1
  # DELETE /next_steps/1.json
  def destroy
    @next_step.destroy
    respond_to do |format|
      format.html { redirect_to next_steps_url, notice: 'Next step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_next_step
      @next_step = NextStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def next_step_params
      params.require(:next_step).permit(:goal_id, :next_step, :responsible_party, :due_date, :completed)
    end
end
