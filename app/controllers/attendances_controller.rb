class AttendancesController < ApplicationController
    before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @attendees = @meeting.cohort.individuals
    @attendance = Attendance.new(meeting_id: @meeting.id)
  end

  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:individual_id, :meeting_id)
    end
end
