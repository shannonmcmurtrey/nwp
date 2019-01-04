class AssessmentsController < ApplicationController
  before_action :verify_is_admin

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
    @individual = @assessment.individual

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @individual, notice: 'Assessment was successfully created.' }
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
    @individual = @assessment.individual
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to @individual, notice: 'Assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @individual = @assessment.individual
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to @individual, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
      @individual = @assessment.individual
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params.require(:assessment).permit(:date_collected,
                                         :self_sufficency_goal,
                                         :self_sufficiency_goal_other,
                                         :still_resident_of_neighborhood_years,
                                         :still_resident_of_neighborhood_months,
                                         :currently_employed,
                                         :employment_type,
                                         :employer, 
                                         :position,
                                         :hours_worked_per_week,
                                         :monthly_wage,
                                         :if_unemployed_eligible_to_work,
                                         :number_of_jobs_in_last_six_months,
                                         :filed_1040_in_last_year,
                                         :last_calendar_years_income,
                                         :currently_receive_earned_income_tax_credit,
                                         :earned_income_tax_credit_amount,
                                         :child_support,
                                         :currently_registered_to_vote,
                                         :vote_local,
                                         :vote_state,
                                         :vote_federal,
                                         :vote_frequency,
                                         :educational_training_last_six_months,
                                         :education_currently_enrolled,
                                         :education_institution_name,
                                         :education_studying,
                                         :education_program_length_in_months,
                                         :education_progress,
                                         :education_degree_type,
                                         :medical_high_blood_sugar,
                                         :medical_diabetes,
                                         :medical_diabetes_type,
                                         :medical_pulmonary_disease,
                                         :medical_elevated_blood_pressure,
                                         :medical_elevated_blood_pressure_gestational,
                                         :medical_mental_health_diagnosis,
                                         :medical_tobacco_products,
                                         :medical_alcohol,
                                         :medical_alcohol_avg_drinks_per_week,
                                         :medical_height,
                                         :medical_weight,
                                         :ssa_medical_physical_family_member_impact,
                                         :health_insurance,
                                         :health_insurance_primary,
                                         :health_insurance_children,
                                         :health_insurance_spouse_or_significant_other,
                                         :primary_care_physician_primary,
                                         :primary_care_physician_children,
                                         :primary_care_physician_spouse_or_significant_other,
                                         :medical_treatment_location,
                                         :current_health,
                                         :happiness_level,
                                         :childhood_raisedby_other_than_parents,
                                         :childhood_raisedby_other_than_parents_length_in_months,
                                         :childhood_raisedby_other_than_parents_by_who,
                                         :childhood_residence_away_from_family,
                                         :childhood_residence_away_from_family_length_in_months,
                                         :childhood_swore_at_or_put_down,
                                         :childhood_made_to_feel_afraid_of_injury,
                                         :childhood_pushed_shoved_grabbed_slapped,
                                         :childhood_hit_hard,
                                         :childhood_lived_with_alcoholic,
                                         :childhood_lived_with_drug_user,
                                         :childhood_lived_with_depressed_or_mentally_ill,
                                         :childhood_lived_with_member_who_attempted_suicide,
                                         :childhood_lived_with_member_went_to_jail,
                                         :childhood_jailed_family_member_which,
                                         :childhood_caregiver_was_pushed_shoved_grabbed_slapped,
                                         :childhood_caregiver_bitten_or_hit,
                                         :childhood_caregiver_hit_repeatedly,
                                         :childhood_caregiver_threatened_with_weapon,
                                         :ever_been_to_jail,
                                         :in_need_of_current_criminal_resolution,
                                         :household_member_in_jail,
                                         :household_member_in_jail_current_criminal_resoution_need,
                                         :adult_household_member_gone_to_jail,
                                         :adult_criminal_resolution_needed,
                                         :other_legal_matters_need_resolved,
                                         :cocaine_crack_speed,
                                         :meth,
                                         :marijuana,
                                         :heroin_opiates,
                                         :other_boolean,
                                         :drug_date_of_last_use,
                                         :written_plan_to_become_self_sufficient,
                                         :current_budget_and_savings_plan,
                                         :safe_and_stable_place_to_live,
                                         :people_in_my_life_i_can_trust_for_support,
                                         :people_in_my_life_serving_as_mentors,
                                         :number_of_people_trusted_for_emotional_or_moral_support,
                                         :number_of_people_trusted_for_mentorship,
                                         :most_people_can_be_trusted,
                                         :i_trust_people_in_my_neighborhood,
                                         :i_trust_police_in_my_community,
                                         :i_trust_local_govt,
                                         :last_six_months_worked_on_neighborhood_project,
                                         :last_six_months_worked_with_neighborhood_partners,
                                         :last_six_months_volunteered,
                                         :last_six_months_attended_public_meetings_for_neighborhood,
                                         :last_six_months_attended_public_meetings_for_schools,
                                         :last_six_months_attended_politial_rally,
                                         :last_six_months_been_at_friends_home,
                                         :last_six_months_had_friend_of_different_race_in_home,
                                         :last_six_months_been_in_home_of_friend_of_different_race,
                                         :last_six_months_been_in_home_of_someone_from_different_neighbor,
                                         :last_six_months_had_friend_from_different_neighborhood_in_my_ho,
                                         :last_six_months_donated_food_or_other_goods,
                                         :last_six_months_opened_or_added_money_to_savings_account,
                                         :last_six_months_paid_off_credit_card_bill_or_title_loan,
                                         :last_six_months_obtained_a_better_paying_job,
                                         :last_six_months_obtained_a_car,
                                         :last_six_months_received_food_clothing_or_other_donated_goods,
                                         :examined_credit_score_in_last_six_months,
                                         :credit_score,
                                         :belong_to_neighborhood_association,
                                         :neighborhood_association_name,
                                         :currently_serve_as_officer_or_on_committee,
                                         :officer_or_committee_organization_name,
                                         :how_often_do_you_talk_to_immediate_neighbors,
                                         :neighborhood_safe_place_to_live_rating,
                                         :my_impact_on_neighborhood_safety,
                                         :people_running_my_community_care_about_me,
                                         :religious_or_spiritual_preference,
                                         :name_of_place_of_worship,
                                         :how_often_attend_religious_services,
                                         :ssa_primary_adult_enrolled_best_description_academic,
                                         :primary_adult_enrolled_parenting,
                                         :ssa_family_best_description_current_situation_income,
                                         :ssa_primary_adult_enrolled_best_description_employment,
                                         :family_best_description_current_situation_food,
                                         :ssa_family_best_description_current_situation_housing,
                                         :ssa_family_best_description_current_situation_transportation,
                                         :currently_have_required_auto_insurance,
                                         :currently_have_valid_drivers_license,
                                         :no_license_reason,
                                         :part_of_matched_circle,
                                         :number_of_circle_allies,
                                         :ssa_quality_childcare,
                                         :attended_at_least_two_weekly_meetings_each_of_last_six_months,
                                         :worked_with_ally_in_last_six_months,
                                         :economic_stability_goals_for_next_six_months,
                                         :goals_accomplished_in_previous_six_months,
                                         :ssa_family_best_description_current_situation_mental_health,
                                         :ssa_primary_adult_enrolled_best_description_stressors,
                                         :completed_parenting_program_in_last_three_years,
                                         :parenting_program_name,
                                         :children_currently_in_accredited_child_care_after_school_care,
                                         :all_sources_of_earned_income_last_30_days,
                                         :child_support_received_last_30_days,
                                         :social_security_last_30_days,
                                         :military_or_va_pension_last_30_days,
                                         :other_last_30_days,
                                         :food_stamps_last_30_days,
                                         :public_assistance_last_30_days,
                                         :unemployment_benefits_last_30_days,
                                         :other_public_benefits_last_30_days,
                                         :pell_grant_monthly_amount,
                                         :student_loan_as_income_monthly_amount,
                                         :military_veterans_education_as_income_monthly_amount,
                                         :daycare_monthly_amount,
                                         :transportation_monthly_amount,
                                         :other_monthly_amount,
                                         :checking_account_balance,
                                         :savings_account_balance,
                                         :ida_account_balance,
                                         :other_investments_balance,
                                         :expenses_rent_mortgage,
                                         :expenses_rent_to_own,
                                         :expenses_city_utilities,
                                         :expenses_cable,
                                         :expenses_phone,
                                         :expenses_internet,
                                         :expenses_prescriptions,
                                         :expenses_food,
                                         :expenses_car_payments,
                                         :expenses_transportation,
                                         :expenses_personal_expenses,
                                         :expenses_entertainment,
                                         :expenses_medical_insurance,
                                         :expenses_tobacco,
                                         :expenses_alcohol,
                                         :expenses_child_support,
                                         :debt_credit_card,
                                         :debt_medical_bills,
                                         :debt_student_loans,
                                         :debt_personal_loans,
                                         :debt_payday_loans,
                                         :debt_car_loans,
                                         :debt_legal_judgement,
                                         :debt_other,
                                         :health_insurance_primary_other, 
                                         :health_insurance_children_other, 
                                         :health_insurance_spouse_or_significant_other_other,
                                         :health_insurance_primary_other, 
                                         :health_insurance_children_other, 
                                         :health_insurance_spouse_or_significant_other_other,
                                         :drug_date_of_last_use_ccs, 
                                         :drug_date_of_last_use_meth, 
                                         :drug_date_of_last_use_marijuana, 
                                         :drug_date_of_last_use_heroin, 
                                         :drug_date_of_last_use_other,
                                         :last_six_months_had_friends_in_home,
                                         :member_of_religious_group, 
                                         :convicted_of_crime_last_six_months,
                                         :number_of_people_help_financially, 
                                         :highest_education_attained, 
                                         :last_grade_completed, 
                                         :technical_training_degree, 
                                         :associates_degree_type,
                                         :bachelors_degree_type, 
                                         :masters_degree_type,
                                         :marital_status,
                                         :individual_id, 
                                         :ssa_health_insurance_type,
                                         :ssa_legal_non_criminal,
                                         :ssa_support_system,
                                         :ssa_food,
                                         :ssa_home_safety,
                                         :ssa_community_involvement,
                                         :ssa_criminal, 
                                         :ssa_title_of_degree,
                                         :ssa_health_insurance_primary,
                                         :ssa_health_insurance_primary_other,
                                         :ssa_health_insurance_children,
                                         :ssa_health_insurance_children_other,
                                         :ssa_highest_grade_completed,
                                         :ssa_title_of_training,
                                         :ssa_primary_adult_enrolled_parenting, 
                                         :voter
                                         )
    end
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
