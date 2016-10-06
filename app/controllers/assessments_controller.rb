class AssessmentsController < ApplicationController
  before_filter :verify_is_admin

  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  # GET /assessments
  # GET /assessments.json
  def index
    @assessments = Assessment.all
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @individual = Individual.find(params[:individual_id])
    @assessment = Assessment.new(individual_id: params[:individual_id])
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @assessment, notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to @assessment, notice: 'Assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params.require(:assessment).permit(:self_sufficency_goal, :self_sufficiency_goal_other, :currently_registered_to_vote, :vote_local, :boolean, :vote_state, :boolean, :vote_federal, :boolean, :vote_frequency, :educational_training_last_six_months, :education_currently_enrolled, :education_institution_name, :education_studying, :education_program_length_in_months, :education_progress, :education_degree_type, :medical_high_blood_sugar, :medical_diabetes, :medical_diabetes_type, :medical_pulmonary_disease, :medical_elevated_blood_pressure, :medical_elevated_blood_pressure_gestational, :medical_mental_health_diagnosis, :medical_tobacco_products, :medical_alcohol, :medical_alcohol_avg_drinks_per_week, :medical_height, :medical_weight, :medical_physical_family_member_impact, :health_insurance, :health_insurance_primary, :health_insurance_primary_type, :health_insurance_primary_other, :health_insurance_children, :health_insurance_children_type, :health_insurance_children_other, :health_insurance_spouse_significant, :health_insurance_spouse_significant, :type, :health_insurance_spouse_significant_other, :primary_care_physician, :primary_care_physician_children, :medical_treatment_location, :current_health, :happiness_level, :childhood_raisedby_other_than_parents, :childhood_raisedby_other_than_parents_length_in_months, :childhood_raisedby_other_than_parents_by_who, :childhood_residence_away_from_family, :childhood_residence_away_from_family_length_in_months, :childhood_swore_at_or_put_down, :childhood_made_to_feel_afraid_of_injury, :childhood_pushed, :childhood_hit_hard, :childhood_lived_with_alcoholic, :childhood_lived_with_drug_user, :childhood_lived_with_depressed_or_mentally_ill, :childhood_lived_with_member_who_attempted_suicide, :childhood_lived_with_member_went_to_jail, :childhood_jailed_family_member_which, :childhood_caregiver_was_pushed, :childhood_caregiver_bitten_or_hit, :childhood_caregiver_hit_repeatedly, :childhood_caregiver_threatened_with_weapon, :ever_been_to_jail, :household_member_in_jail, :household_member_in_jail_resoution_need, :adult_household_member_gone_to_jail, :adult_criminal_resolution_needed, :legal_matters_need_resolved, :cocaine_crack_speed, :meth, :marijuana, :heroin_opiates, :other_boolean, :drug_date_of_last_use, :individual_id)
    end
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
