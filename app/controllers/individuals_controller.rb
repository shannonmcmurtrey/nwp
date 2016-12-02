class IndividualsController < ApplicationController
  before_filter :verify_is_admin, :except => [:check_code, :new, :create, :show, :edit, :update]
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
    if !current_user.admin? && current_user.individual != @individual
      redirect_to "/"
    end
    unless @individual.cohort_id.nil?
      @cohort = Cohort.find(@individual.cohort_id)
    end
  end

  # GET /individuals/new
  def new
    @organization = Organization.find(params[:organization_id])
    @individual = Individual.new(organization_id: params[:organization_id])
    @individual.household_members.build
  end

  # GET /individuals/1/edit
  def edit
    @organization = Organization.find(@individual.organization_id)
    unless @individual.cohort_id.nil?
      @cohort = Cohort.find(@individual.cohort_id)
    end
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @organization = Organization.find_by_code(params[:individual][:code])
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

  def check_code
    @organization = Organization.find_by_code(params[:code])
    if @organization != nil
        redirect_to new_individual_path(organization_id: @organization.id)
    else
      flash[:alert] = "Sorry, I can't find that code."
      redirect_to "/"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:first_name, :last_name, :suffix, :address_line_1, :address_line_2, 
                                         :city, :state, :zip, :phone_number, :mobile_phone_number, 
                                         :email_address, :DOB, :start_date, :us_citizen, 
                                         :ethnicity, :ethnicity_other, :lanuage_primary, :language_other, 
                                         :springfield_native, :springfield_native_neighborhood, 
                                         :springfield_non_native_population, 
                                         :neighborhood_resident_length_in_months, 
                                         :springfield_non_native_distance, 
                                         :childhood_raisedby_other_than_parents, 
                                         :childhood_raisedby_other_than_parents_length_in_months, 
                                         :childhood_raisedby_other_than_parents_by_who, 
                                         :childhood_residence_away_from_family, 
                                         :childhood_residence_away_from_family_length_in_months, 
                                         :childhood_swore_at_or_put_down, 
                                         :childhood_made_to_feel_afraid_of_injury, 
                                         :childhood_pushed_shoved_grabbed_slapped, 
                                         :childhood_hit_hard, :childhood_lived_with_alcoholic, 
                                         :childhood_lived_with_drug_user, 
                                         :childhood_lived_with_depressed_or_mentally_ill, 
                                         :childhood_lived_with_member_who_attempted_suicide, 
                                         :childhood_lived_with_member_went_to_jail, 
                                         :childhood_jailed_family_member_which, 
                                         :childhood_caregiver_was_pushed_shoved_grabbed_slapped, 
                                         :childhood_caregiver_bitten_or_hit, 
                                         :childhood_caregiver_hit_repeatedly, 
                                         :childhood_caregiver_threatened_with_weapon, :cohort_id,
                                         :preferred_method_of_contact, :non_us_citizen_country_of_citizenship, 
                                         :cohort_id, :organization_id, :date_of_application, :alternate_phone, 
                                         :willing_and_able_to_commit_to_program, :specific_days_that_do_not_work, 
                                         :days_and_times_not_available, :currently_employed, :employed_full_or_part_time, 
                                         :employer, :position, :avg_hours_worked_per_week, :hourly_wage, :salary, 
                                         :employer_benefits, :not_employed_but_eligible, :how_many_jobs_in_last_six_months, 
                                         :total_family_income_from_all_sources, :child_support, :other_sources_of_income, 
                                         :currently_file_taxes, :receive_earned_income_tax_credit, 
                                         :highest_education_attained, :highest_education_attained_by_parent_or_caretaker, 
                                         :marital_status, :children_living_outside_home, :children_outside_home_who, 
                                         :parenting_class, :parenting_class_which, :quality_childcare, 
                                         :children_currently_in_quality_care, :children_in_quality_care_explain, 
                                         :have_health_care_in_some_form, :have_health_care_in_some_form_explain, 
                                         :children_have_health_care_in_some_form, 
                                         :children_have_health_care_in_some_form_explain, 
                                         :currently_have_stable_housing, :rent_or_own, 
                                         :monthly_rent_or_mortgage_payment, :receive_rent_rebate, 
                                         :currently_receive_public_housing_assistance, 
                                         :currently_receive_private_subsidized_housing_assistance, 
                                         :use_section_eight_voucher, :currently_have_reliable_transportation, 
                                         :reliable_transportation_method, :reliable_transportation_method_other, 
                                         :possible_to_obtain_reliable_transportation_in_sixty_days, 
                                         :have_required_auto_insurance, :have_valid_id_or_drivers_license, 
                                         :no_valid_id_or_license_reason, :revoked_or_suspended_license_explanation, 
                                         :ever_convicted_of_felony, :ever_convicted_of_misdemeanor, 
                                         :current_pending_court_cases, :any_legal_matters_needing_resolution, 
                                         :nwp_assets_family, :nwp_assets_lives_in_neighborhood, 
                                         :nwp_assets_accountability, :nwp_assets_parenting_training, 
                                         :nwp_assets_ged_highschool_college, :nwp_assets_transportation, 
                                         :nwp_assets_stable_housing, :nwp_assets_quality_childcare, 
                                         :nwp_assets_earned_income_tax_credit, 
                                         :nwp_assets_resolved_criminal_background_na, 
                                         :nwp_assets_monthly_budget_management, 
                                         :nwp_assets_health_care_insurance, :nwp_currently_eligible, 
                                         :square_footage_of_house, :notes, :code, :last_grade_completed,
                                         :technical_training_degree, :associates_degree_type,
                                         :bachelors_degree_type, :masters_degree_type, :user_id,
                                         household_members_attributes: [:id, :name, :relationship, :age, :school, :care_provider, :_destroy])
    end
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
