class NotesController < ApplicationController
  before_filter :verify_is_admin
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @individual = Individual.find(params[:individual_id])
    @user = User.find(params[:user_id])
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
        @user = current_user

  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @individual = @note.individual

    respond_to do |format|
      if @note.save
        format.html { redirect_to @individual, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @individual = @note.individual
    @user = current_user
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @individual, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @individual = @note.individual
    @note.destroy

    respond_to do |format|
      format.html { redirect_to @individual, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
      @individual = @note.individual
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:individual_id, :user_id, :note_date, :method_of_contact, :contact_length, :update_on_last_action, :needs_addressed, :other_notes, :next_appointment)
    end
     def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
