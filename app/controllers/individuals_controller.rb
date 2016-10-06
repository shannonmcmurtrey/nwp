class IndividualsController < ApplicationController
  before_filter :verify_is_admin
  before_action :set_individual, only: [:show, :edit, :update, :destroy]


  # GET /individuals
  # GET /individuals.json
  def index
    if params[:search]
      @individuals = Individual.search(params[:search]).order("created_at DESC")
      redirect_to individual_path(@individuals.first) if @individuals.count == 1
    else
      @individuals = Individual.all.order('created_at DESC')
    end
  end

  # GET /individuals/1
  # GET /individuals/1.json
  def show
  end

  # GET /individuals/new
  def new
    @cohort = Cohort.find(params[:cohort_id])
    @individual = Individual.new(cohort_id: params[:cohort_id])
  end

  # GET /individuals/1/edit
  def edit
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @individual = Individual.new(individual_params)

    respond_to do |format|
      if @individual.save
        format.html { redirect_to @individual, notice: 'Individual was successfully created.' }
        format.json { render :show, status: :created, location: @individual }
      else
        format.html { render :new }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1
  # PATCH/PUT /individuals/1.json
  def update
    respond_to do |format|
      if @individual.update(individual_params)
        format.html { redirect_to @individual, notice: 'Individual was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  # DELETE /individuals/1.json
  def destroy
    @individual.destroy
    respond_to do |format|
      format.html { redirect_to individuals_url, notice: 'Individual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:first_name, :last_name, :address_line_1, :address_line_2, :city, :state, :zip, :phone_number, :mobile_phone_number, :email_address, :DOB, :start_date, :us_citizen, :non_us_citizen, :ethnicity, :ethnicity_other, :lanuage_primary, :language_other, :springfield_native, :springfield_native_neighborhood, :springfield_non_native_population, :neighborhood_resident_length_in_months, :springfield_non_native_distance, :cohort_id)
    end
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
