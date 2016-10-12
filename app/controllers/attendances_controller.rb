class AttendancesController < ApplicationController
    before_action :set_attendance, only: [:show, :edit, :update, :destroy]


  def index
    @attendances = Attendance.all
  end

  def show
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @attendance.update(edit_attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @attendances = []
    @meeting = Meeting.find(params[:meeting_id])
    @meeting.cohort.individual_ids.map do |individual_id|
      @attendances << Attendance.new(individual_id: individual_id, meeting_id: @meeting.id)
    end
  end

  def create
    params["attendance"].each do |attendance|
      @attendance = Attendance.create(attendance_params(attendance))
    end

    respond_to do |format|
      if @attendance.save
        format.html {redirect_to meetings_path, notice: "You added the attendance!" }
      else
        redirect_to new_attendances_path(attendance_params)
      end
   end
  end

  

  def destroy
    redirect_to attendances_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params(attendance)
      params.require(:attendance).permit!
      return params["attendance"][attendance]
    end

    def edit_attendance_params
      params.require(:attendance).permit!
    end

end
