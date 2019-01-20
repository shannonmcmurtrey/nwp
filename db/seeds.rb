# This file contains all the record creation needed to seed the database for developers.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Sample Admin User (login with this account to test website)
User.create(
  first_name: "NWP",
  last_name: "Admin",
  admin: true,
  super_user: true,
  social_worker: true,
  email: "nwpadmin@example.org",
  password: "password",
)

# Sample Admin User (actual project lead)
User.create(
  first_name: "Shannon",
  last_name: "McMurtrey",
  admin: true,
  super_user: true,
  social_worker: true,
  email: "smcmurtrey@drury.edu",
  password: "password",
)

# Sample Admin User (actual student contributor)
User.create(
  first_name: "Eric",
  last_name: "McCoullough",
  admin: true,
  super_user: true,
  social_worker: true,
  email: "eric96@live.missouristate.edu",
  password: "password",
)

# Sample Organization (actual organization)
Organization.create(
  name: "The Fairbanks",
  address_line_1: "1126 N Broadway Ave",
  address_line_2: "",
  city: "Springfield",
  state: "MO",
  zip: "65802",
  phone_number: "(417) 720-1890",
  website: "drewlewis.org/about-fairbanks/",
  primary_contact: "",
  code: "nwp",
)

require 'faker'

# Configure Faker Locale for Phone Numbers, etc
Faker::Config.locale = 'en-US'

# Configure Number of Sample Records to Create Per Table
organization_count = 10
user_count = 100
cohort_count = 10
meeting_count = 50
individual_count = 100

# SOURCE: https://en.wikipedia.org/wiki/Springfield_metropolitan_area,_Missouri
city_list_sgf_msa = [
    "Springfield",
    "Nixa",
    "Ozark",
    "Republic",
    "Branson",
    "Bolivar",
    "Marshfield",
    "Battlefield",
    "Willard",
    "Hollister",
    "Rogersville",
    "Buffalo",
    "Clever",
    "Forsyth",
    "Strafford",
    "Kimberling City",
    "Seymour",
    "Sparta",
    "Merriam Woods",
    "Ash Grove",
    "Fair Grove",
    "Crane",
    "Shell Knob",
    "Kissee Mills",
    "Billings",
    "Humansville",
]

#SOURCE: https://www.springfieldmo.gov/DocumentCenter/View/20479/Zone-Blitz_handout?bidId=
neighborhood_list_sgf_zone1 = [
    "Bissett",
    "Dolling Park",
    "Downtown",
    "Grant Beach",
    "Heart of the Westside",
    "Midtown",
    "Tom Watkins",
    "West Central",
    "Westside",
    "Woodland Heights",
    "Young Lilly",
]

# Create Sample Organizations
organization_count.times do
  Organization.create(
    name: Faker::Company.name,
    address_line_1: Faker::Address.street_address,
    address_line_2: Faker::Boolean.boolean(0.50) ? Faker::Address.secondary_address : "",
    # TODO: Populate CITY and ZIP from a list of corresponding CITY/ZIP pairs for SGF and surrounding area
    city: city_list_sgf_msa.sample,
    state: "MO",
    # SOURCE: https://www.zip-codes.com/state/mo.asp
    zip: Faker::Number.between(63005, 65899),
    # NOTE: 555-0100 through 555-0199 are specifically reserved for fictional use
    phone_number: "(417) 555-01" + Faker::Number.leading_zero_number(2),
    website: Faker::Internet.domain_name,
    primary_contact: Faker::Name.name,
#    created_at: Faker::Time.backward(365),
#    updated_at: Faker::Time.backward(365),
    code: Faker::Number.between(10000, 99999),
  )
end

# Create Sample Social Workers
user_count.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: false,
    super_user: false,
    social_worker: Faker::Boolean.boolean(0.20),
    email: Faker::Internet.safe_email,
    password: "p4ssw0rd",
    sign_in_count: Faker::Number.between(0, 50),
    current_sign_in_at: Faker::Time.backward(365),
    last_sign_in_at: Faker::Time.backward(365),
    current_sign_in_ip: Faker::Internet.private_ip_v4_address,
    last_sign_in_ip: Faker::Internet.private_ip_v4_address,
#    created_at: Faker::Time.backward(365),
#    updated_at: Faker::Time.backward(365),
    organization_id: Faker::Number.between(1, organization_count),
  )
end

# Create Sample Cohorts
cohort_count.times do
  cohort_start_date = Faker::Date.between(2.year.ago, Date.today)

  Cohort.create(
    start_date: cohort_start_date,
    # Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    meeting_night: cohort_start_date.strftime('%A'),
    # TODO: Verify input format, meeting length. Assuming evenings and 2 hour meetings.
    meeting_time: [
      "5:30-7:30pm",
      "6-8pm",
      "6:30-8:30pm",
      "7-9pm",
      "7:30-9:30pm",
      "8-10pm",
      "8:30-10:30pm"
      ].sample,
    organization_id: Faker::Number.between(1, organization_count),
#    created_at: Faker::Time.backward(365),
#    updated_at: Faker::Time.backward(365),
  )
end

# Create Sample Meetings
meeting_count.times do
  Meeting.create(
    # TODO: Populate with more realistic meeting names
    name: Faker::Lorem.sentence,
    # TODO: Populate with samples of prior meeting topics
    topic: [
      "Budgeting and Banking",
      "Family",
      "Healthy Homes",
      "Neighborhood",
      "Short-Term Goals",
      "Long-Term Goals",
    ].sample,
    # TODO: Meeting date should match cohort day of week
    meeting_date: Faker::Date.between(1.year.ago, Date.today),
    cohort_id: Faker::Number.between(1, cohort_count),
#    created_at: Faker::Time.backward(365),
#    updated_at: Faker::Time.backward(365),
  )
end

# Create Sample Individuals
individual_count.times do
  individual_us_citizen = Faker::Boolean.boolean(0.95)

  Individual.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address_line_1: Faker::Address.street_address,
    address_line_2: Faker::Address.secondary_address,
    city: city_list_sgf_msa.sample,
    state: "MO",
    # SOURCE: https://www.zip-codes.com/state/mo.asp
    zip: Faker::Number.between(63005, 65899),
    # NOTE: 555-0100 through 555-0199 are specifically reserved for fictional use
    phone_number: "(" + Faker::PhoneNumber.area_code + ") 555-01" + Faker::Number.leading_zero_number(2),
    mobile_phone_number: "(" + Faker::PhoneNumber.area_code + ") 555-01" + Faker::Number.leading_zero_number(2),
    email_address: Faker::Internet.safe_email,
    # "Mobile"=>0, "Home Phone"=>1, "Email"=>2, "Text"=>3, "Facebook"=>4
    preferred_method_of_contact: Faker::Number.between(0, 4),
    DOB: Faker::Date.between(80.year.ago, 18.year.ago),
    start_date: Faker::Date.between(3.year.ago, Date.today),
    # 95% Citizen, 5% Non-Citizen
    us_citizen: individual_us_citizen,
    # NOTE: Only populate COUNTRY if prior answer is FALSE
    non_us_citizen_country_of_citizenship: individual_us_citizen ? "" : Faker::Address.country_code,
    # "White" => 0, "Hispanic/Latino" => 1, "Black or African American" =>  2, "Asian" => 3, "American Native or Alaska Native" => 4, "Middle Eastern or North African" => 5, "Native Hawaiian or Pacific Islander" => 6, "Other race, ethnicity, or origin" => 7
    ethnicity: Faker::Number.between(0, 7),
    # TODO: Only populate OTHER below if ID above is 7 (OTHER)
    ethnicity_other: Faker::Demographic.race,
    # NOTE: Input value "English" 95% of the time, "Other" 5% of the time
    lanuage_primary: Faker::Boolean.boolean(0.95) ? "English" : "Other",
    # TODO: Only populate OTHER below if "Other" is specified above
    # Source: https://www.missourieconomy.org/researchandplanning/pdfs/population_data_many_mo_languages.pdf
    language_other: ["Spanish", "German", "Chinese", "French", "Serbo-Croatian"].sample,
    # 80% Native, 20% Non-Native
    springfield_native: Faker::Boolean.boolean(0.80),
    springfield_native_neighborhood: neighborhood_list_sgf_zone1.sample,
    # "Less than 2,000" => 0, "2,000-9,999" => 1, "10,000-49,000"=>2, "50,000-99,000"=>3, "100,000-249,000"=>4, "250,000 to 1 million"=>5, "Over 1 million"=>6
    springfield_non_native_population: Faker::Number.between(0, 6),
    neighborhood_resident_length_in_months: Faker::Number.between(0, 120),
    # "under 25 miles"=>0, "26-50 miles"=>1, "51-100 miles"=>2, "over 100 miles"=>3
    springfield_non_native_distance: Faker::Number.between(0, 3),
#    created_at: Faker::Time.backward(365),
#    updated_at: Faker::Time.backward(365),

    # NOTE: Do not populate valid Cohort ID for all Individuals. Leave empty for small percentage.
    cohort_id: Faker::Boolean.boolean(0.90) ? Faker::Number.between(1, cohort_count) : nil,

    # "Grandparent(s)"=>0, "Aunt/Uncle"=>1, "Other relative"=>2, "Not a relative"=>3
    childhood_raisedby_other_than_parents: Faker::Number.between(0, 3),
    # TODO: Only populate 3 fields below if above is NULL
    # Values: 0 years to 216 months (18 years)
    childhood_raisedby_other_than_parents_length_in_months: Faker::Number.between(0, 216),
    # "Grandparent(s)"=>0, "Aunt/Uncle"=>1, "Other relative"=>2, "Not a relative"=>3
    childhood_raisedby_other_than_parents_by_who: Faker::Number.between(0, 3),
    childhood_residence_away_from_family: Faker::Boolean.boolean(0.20),
    # TODO: Only populate if above is TRUE
    childhood_residence_away_from_family_length_in_months: Faker::Number.between(0, 216),
    # [1, 'Yes'], [0, 'No']
    ACE_swore_at_or_put_down: Faker::Boolean.boolean(0.20),
    childhood_made_to_feel_afraid_of_injury: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_pushed_shoved_grabbed_slapped: Faker::Boolean.boolean(0.20),
    childhood_hit_hard: Faker::Boolean.boolean(0.20),
    childhood_lived_with_alcoholic: Faker::Boolean.boolean(0.20),
    childhood_lived_with_drug_user: Faker::Boolean.boolean(0.20),
    childhood_lived_with_depressed_or_mentally_ill: Faker::Boolean.boolean(0.20),
    childhood_lived_with_member_who_attempted_suicide: Faker::Boolean.boolean(0.20),
    childhood_lived_with_member_went_to_jail: Faker::Boolean.boolean(0.20),
    # TODO: Only populate if value above is TRUE. Populate with random relationship type.
    childhood_jailed_family_member_which: "relation",
    #childhood_jailed_family_member_which: Faker::Relationship.familial,
    childhood_caregiver_was_pushed_shoved_grabbed_slapped: Faker::Boolean.boolean(0.20),
    childhood_caregiver_bitten_or_hit: Faker::Boolean.boolean(0.20),
    childhood_caregiver_hit_repeatedly: Faker::Boolean.boolean(0.20),
    organization_id: Faker::Number.between(1, organization_count),
    date_of_application: Faker::Date.between(3.year.ago, Date.today),

    alternate_phone: "(" + Faker::PhoneNumber.area_code + ") 555-01" + Faker::Number.leading_zero_number(2),

    # "Yes"=>true, "No"=>false
    willing_and_able_to_commit_to_program: Faker::Boolean.boolean(0.95),
    # TODO: Invert field values so they match typical Yes/No values (e.g. Boolean True/False or 1=Yes,0=No)
    # "Yes"=>0, "No"=>1
    specific_days_that_do_not_work: Faker::Boolean.boolean(0.95),
    # TODO: Populate only when prior answer is YES, generate random Day/Time values
    days_and_times_not_available: "Monday evenings",
    # "Yes"=>0, "No"=>1, "Disabled"=>3, "Retired"=>4, "Temporary/Seasonal"=>5
    currently_employed: Faker::Number.between(0, 5),
    # "Full-Time"=>0, "Part-Time"=>1
    employed_full_or_part_time: Faker::Number.between(0, 1),
    employer: Faker::Company.name,
    position: Faker::Company.profession,
    avg_hours_worked_per_week: Faker::Number.between(0, 80),
    # TODO: Only populate Hourly Wage OR Annual Salary OR NEITHER. Do not populate both.
    hourly_wage: Faker::Number.decimal(2),
    salary: Faker::Number.between(5000, 25000),
    employer_benefits: [
      "",
      "Sick Leave",
      "Paid Time Off",
      "Health",
      "Medical",
      "Health and Dental"
      ].sample,
    # "Yes"=>0, "No"=>1
    not_employed_but_eligible: Faker::Boolean.boolean(0.20),
    how_many_jobs_in_last_six_months: Faker::Number.between(0, 6),
    total_family_income_from_all_sources: Faker::Number.between(5000, 35000),
    # "eligible, no income benefit"=>0, "eligible, partial or irregular income"=>1, "eligible, receives full amount of income ordered"=>2, "not eligible / not applicable"=>3
    child_support: Faker::Number.between(0, 3),
    other_sources_of_income: [
      "",
      "Friends",
      "Family",
      "Assistance"
      ].sample,
    # "Yes"=>true, "No"=>false
    currently_file_taxes: Faker::Boolean.boolean(0.6),
    # "Yes"=>true, "No"=>false
    receive_earned_income_tax_credit: Faker::Boolean.boolean(0.6),
    # "Less than high school"=>0, "High School Diploma (or equivalent, HiSET)"=>1, "Attended, but did not complete college or technical training"=>2, "Completed technical training (CNA, cosmetology, auto mechanic, etc)"=>3, "Associate's Degree (2-year degree)"=>4, "Bachelor's Degree (4-year degree)"=>5, "Master's Degree"=>6
    highest_education_attained: Faker::Number.between(0, 6),
    # "Less than high school"=>"Less than high school", "High School Diploma (or equivalent, HiSET)"=>"High School Diploma (or equivalent, HiSET)", "Attended, but did not complete college or technical training"=>"Attended, but did not complete college or technical training", "Completed technical training (CNA, cosmetology, auto mechanic, etc)"=>"Completed technical training (CNA, cosmetology, auto mechanic, etc)", "Associate's Degree (2-year degree)"=>"Associate's Degree (2-year degree)", "Bachelor's Degree (4-year degree)"=>"Bachelor's Degree (4-year degree)", "Master's Degree"=>"Master's Degree", "Unknown"=>"Unknown"
    highest_education_attained_by_parent_or_caretaker: [
      "Less than high school",
      "High School Diploma (or equivalent, HiSET)",
      "Attended, but did not complete college or technical training",
      "Completed technical training (CNA, cosmetology, auto mechanic, etc)",
      "Associate's Degree (2-year degree)",
      "Bachelor's Degree (4-year degree)",
      "Master's Degree",
      "Unknown"
      ].sample,
    # "Married"=>0, "Divorced"=>1, "Widowed"=>2, "Single (never married)"=>3, "Separated"=>4
    marital_status: Faker::Number.between(0, 4),
    # "Yes"=>true, "No"=>false
    children_living_outside_home: Faker::Boolean.boolean(0.2),
    # TODO: Only populate when answer above is TRUE
    # How Many?
    children_outside_home_who: Faker::Number.between(0, 6),
    # TODO: Invert field values so they match typical Yes/No values (e.g. Boolean True/False or 1=Yes,0=No)
    # "Yes"=>0, "No"=>1
    parenting_class: Faker::Boolean.boolean(0.4),
    # TODO: Populate only when prior answer is "Yes"
    # Examples: Pregnancy ABC's; 1-2-3 Magic; Love & Logic; Triple P - Positive Parenting Program; etc.
    parenting_class_which: [
      "",
      "Pregnancy ABC's",
      "1-2-3 Magic",
      "Love & Logic",
      "Triple P - Positive Parenting Program"
      ].sample,

    # "Child care is needed, unavailable"=>0,
    # "Child care available, cost is unaffordable"=>1,
    # "Child care available, affordable, poor quality"=>2,
    # "Child care available, affordable, good quality"=>3,
    # "Child care available, affordable, good quality, emergency backup plan."=>4,
    # "Childcare not needed"=>5
    quality_childcare: Faker::Number.between(0, 5),
    # "Yes"=>0, "No"=>1, "N/A"=>2
    children_currently_in_quality_care: Faker::Number.between(0, 2),
    # Provide Details
    # TODO: Populate only when prior answer is TRUE
    children_in_quality_care_explain: Faker::Lorem.sentence,

    # "Yes"=>true, "No"=>false
    have_health_care_in_some_form: Faker::Boolean.boolean(0.4),
    # Examples: MO Healthnet, Employer Provided, Affordable Care Act
    have_health_care_in_some_form_explain: [
      "MO Healthnet",
      "Employer Provided",
      "Affordable Care Act"
      ].sample,

    # "Yes"=>true, "No"=>false
    children_have_health_care_in_some_form: Faker::Boolean.boolean(0.4),
    # Examples: MO Healthnet, Employer Provided, Affordable Care Act
    children_have_health_care_in_some_form_explain: [
      "MO Healthnet",
      "Employer Provided",
      "Affordable Care Act"
      ].sample,

    # "Yes"=>true, "No"=>false
    currently_have_stable_housing: Faker::Boolean.boolean(0.8),
    # "Rent"=>0, "Own"=>1
    rent_or_own: Faker::Number.between(0, 1),
    monthly_rent_or_mortgage_payment: Faker::Number.between(200, 2000),

    # "Yes"=>0, "No"=>1
    receive_rent_rebate: Faker::Boolean.boolean(0.5),
    # "Yes"=>0, "No"=>1
    currently_receive_public_housing_assistance: Faker::Boolean.boolean(0.5),
    # "Yes"=>0, "No"=>1
    currently_receive_private_subsidized_housing_assistance: Faker::Boolean.boolean(0.5),
    # "Yes"=>0, "No"=>1
    use_section_eight_voucher: Faker::Boolean.boolean(0.5),

    # "Yes"=>true, "No"=>false
    currently_have_reliable_transportation: Faker::Boolean.boolean(0.5),
    # "Bus"=>0, "Car/Personal Vehicle"=>1, "Other"=>2
    reliable_transportation_method: Faker::Number.between(0, 2),
    # TODO: Populate only when prior answer is 2 (Other)
    reliable_transportation_method_other: [
      "Walking",
      "Bicycle",
      "Motorcycle",
      "Carpool"
      ].sample,
    # "Yes"=>true, "No"=>false
    possible_to_obtain_reliable_transportation_in_sixty_days: Faker::Boolean.boolean(0.5),
    # "Yes"=>true, "No"=>false
    have_required_auto_insurance: Faker::Boolean.boolean(0.5),
    # "Yes"=>true, "No"=>false
    have_valid_id_or_drivers_license: Faker::Boolean.boolean(0.5),
    # TODO: Populate only when prior answer is FALSE
    # "Revoked"=>0, "Lost"=>1, "Suspended"=>2
    no_valid_id_or_license_reason: Faker::Number.between(0, 2),
    # TODO: Populate only when prior answer is 0 (Revoked) or 2 (Suspended)
    revoked_or_suspended_license_explanation: Faker::Lorem.sentence,

    # "Yes"=>true, "No"=>false
    ever_convicted_of_felony: Faker::Boolean.boolean(0.2),
    ever_convicted_of_misdemeanor: Faker::Boolean.boolean(0.2),
    current_pending_court_cases: Faker::Boolean.boolean(0.2),
    any_legal_matters_needing_resolution: Faker::Boolean.boolean(0.2),

    nwp_assets_family: Faker::Boolean.boolean(0.9),
    nwp_assets_lives_in_neighborhood: Faker::Boolean.boolean(0.9),
    nwp_assets_accountability: Faker::Boolean.boolean(0.9),
    nwp_assets_parenting_training: Faker::Boolean.boolean(0.9),
    nwp_assets_ged_highschool_college: Faker::Boolean.boolean(0.9),
    nwp_assets_transportation: Faker::Boolean.boolean(0.9),
    nwp_assets_stable_housing: Faker::Boolean.boolean(0.9),
    nwp_assets_quality_childcare: Faker::Boolean.boolean(0.9),
    nwp_assets_earned_income_tax_credit: Faker::Boolean.boolean(0.9),
    nwp_assets_resolved_criminal_background_na: Faker::Boolean.boolean(0.9),
    nwp_assets_monthly_budget_management: Faker::Boolean.boolean(0.9),
    nwp_assets_health_care_insurance: Faker::Boolean.boolean(0.9),
    nwp_currently_eligible: Faker::Boolean.boolean(0.9),

    square_footage_of_house: Faker::Number.between(200, 2000),

    # TODO: "notes" is NOT a standard text field. You must generate one or more "Notes" records and attach here
    # ERROR: Resolve error "NoMethodError: undefined method `each' for "Sample notes":String"
    #notes: "Sample notes",
    # ERROR: ActiveRecord::AssociationTypeMismatch: Note(#47460272311920) expected, got "Assumenda est omnis..." which is an instance of String(#47460207861300)
    #notes: Faker::Lorem.paragraphs,

    # TODO: Verify standard code format and generate appropriate unique code for this Individual
    code: Faker::Number.between(10000, 99999),

    # "Less than high school"=>0, "High School Diploma (or equivalent, HiSET)"=>1, "Attended, but did not complete college or technical training"=>2, "Completed technical training (CNA, cosmetology, auto mechanic, etc)"=>3, "Associate's Degree (2-year degree)"=>4, "Bachelor's Degree (4-year degree)"=>5, "Master's Degree"=>6
    #highest_education_attained:
    # TODO: Only populate if highest_education_attained=0
    last_grade_completed: Faker::Number.between(0, 20),
    # TODO: Only populate if highest_education_attained=3
    technical_training_degree: Faker::Educator.course,
    # TODO: Only populate if highest_education_attained=4
    associates_degree_type: Faker::Educator.course,
    # TODO: Only populate if highest_education_attained=5
    bachelors_degree_type: Faker::Educator.course,
    # TODO: Only populate if highest_education_attained=6
    masters_degree_type: Faker::Educator.course,

    # TODO: Reference a random valid User record ID
    user_id: Faker::Number.between(1, user_count),
    # "Jr."=>"Jr.", "Sr."=>"Sr.", "II"=>"II", "III"=>"III", "IV"=>"individual_have_valid_id_or_drivers_license"
    suffix: Faker::Name.suffix,

    # [1, 'Yes'], [0, 'No']
    ACE_sexually_abused: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_unloved: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_uncared_for: Faker::Boolean.boolean(0.20),

    # [1, 'Yes'], [0, 'No']
    ACE_broken_home: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_mother_pushed_shoved_grabbed_slapped: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_lived_with_addict: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_household_member_mentally_ill: Faker::Boolean.boolean(0.20),
    # [1, 'Yes'], [0, 'No']
    ACE_household_member_went_to_prison: Faker::Boolean.boolean(0.20),
  )
end
