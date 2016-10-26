class Individual < ApplicationRecord
  belongs_to :cohort
  belongs_to :organization
  has_and_belongs_to_many :meetings
  has_many :attendances

  #validates :attribute_name, :presence => {:message => "Customized error message for user."}
  validates :first_name, :presence => true, on: :create
  validates :last_name, :presence => true, on: :create
  validates :address_line_1, :presence => true, on: :create
  validates :city, :presence => true, on: :create
  validates :state, :presence => true, on: :create
  validates :zip, :presence => true, on: :create
  validates :phone_number, :presence => true, on: :create
  validates :mobile_phone_number,  :presence => true, on: :create
  validates :email_address, :presence => true, on: :create
  validates :preferred_method_of_contact, :presence => true, on: :create
  validates :DOB, :presence => true, on: :create
  validates :organization_id, :presence => true, on: :create
  validates :date_of_application, :presence => true, on: :create
  validates :willing_and_able_to_commit_to_program, :presence => true, on: :create
  validates :specific_days_that_do_not_work,  :presence => true, on: :create
  validates :currently_employed, :presence => true, on: :create
  validates :how_many_jobs_in_last_six_months,  :presence => true, on: :create
  validates :total_family_income_from_all_sources, :presence => true, on: :create
  validates :child_support, :presence => true, on: :create
  validates :currently_file_taxes,  inclusion: { in: [ true, false ] }, on: :create
  validates :highest_education_attained, :presence => true, on: :create
  validates :highest_education_attained_by_parent_or_caretaker,  :presence => true, on: :create
  validates :marital_status, :presence => true, on: :create
  validates :parenting_class, :presence => true, on: :create
  validates :quality_childcare,  :presence => true, on: :create
  validates :children_currently_in_quality_care, :presence => true, on: :create
  validates :have_health_care_in_some_form,  inclusion: { in: [ true, false ] }, on: :create
  validates :children_have_health_care_in_some_form,  inclusion: { in: [ true, false ] }, on: :create
  validates :currently_have_stable_housing,  inclusion: { in: [ true, false ] }, on: :create
  validates :currently_have_reliable_transportation,  inclusion: { in: [ true, false ] }, on: :create
  validates :have_required_auto_insurance, :presence => true, on: :create
  validates :have_valid_id_or_drivers_license,  :presence => true, on: :create
  validates :ever_convicted_of_felony, inclusion: { in: [ true, false ] }, on: :create
  validates :ever_convicted_of_misdemeanor, inclusion: { in: [ true, false ] }, on: :create
  validates :current_pending_court_cases, inclusion: { in: [ true, false ] }, on: :create
  validates :any_legal_matters_needing_resolution, inclusion: { in: [ true, false ] }, on: :create
  validates :have_health_care_in_some_form, inclusion: { in: [ true, false ] }, on: :create
  validates :children_have_health_care_in_some_form, inclusion: { in: [ true, false ] }, on: :create
  validates :currently_have_stable_housing, inclusion: { in: [ true, false ] }, on: :create


  enum ethnicity: { "White" => 0, "Hispanic/Latino" => 1, "Black or African American" =>  2, "Asian" => 3, "American Native or Alaska Native" => 4, "Middle Eastern or North African" => 5, "Native Hawaiian or Pacific Islander" => 6, "Other race, ethnicity, or origin" => 7 }
  enum springfield_non_native_population: {"Less than 2,000" => 0, "2,000-9,999" => 1, "10,000-49,000"=>2, "50,000-99,000"=>3, "100,000-249,000"=>4, "250,000 to 1 million"=>5, "Over 1 million"=>6}
  enum springfield_non_native_distance: {"under 25 miles"=>0, "26-50 miles"=>1, "51-100 miles"=>2, "over 100 miles"=>3}
  enum childhood_raisedby_other_than_parents_by_who: {"Grandparent(s)"=>0, "Aunt/Uncle"=>1, "Other relative"=>2, "Not a relative"=>3}

  def self.search(search)
    where("first_name || last_name  || phone_number LIKE ?", "%#{search}%")
  end

  def to_label
    "#{first_name} #{last_name}"
  end

end
