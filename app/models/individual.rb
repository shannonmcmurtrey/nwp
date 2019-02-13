class Individual < ApplicationRecord
  has_paper_trail
  belongs_to :cohort
  belongs_to :organization
  has_and_belongs_to_many :meetings
  has_many :attendances, dependent: :destroy
  has_many :household_members, dependent: :destroy
  has_many :assessments
  has_many :goals, dependent: :destroy
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :household_members, allow_destroy: true

  #validates :attribute_name, :presence => {:message => "Customized error message for user."}
  


  enum ethnicity: { "White" => 0, "Hispanic/Latino" => 1, "Black or African American" =>  2, "Asian" => 3, "American Native or Alaska Native" => 4, "Middle Eastern or North African" => 5, "Native Hawaiian or Pacific Islander" => 6, "Other race, ethnicity, or origin" => 7 }
  enum springfield_non_native_population: {"Less than 2,000" => 0, "2,000-9,999" => 1, "10,000-49,000"=>2, "50,000-99,000"=>3, "100,000-249,000"=>4, "250,000 to 1 million"=>5, "Over 1 million"=>6}
  enum springfield_non_native_distance: {"under 25 miles"=>0, "26-50 miles"=>1, "51-100 miles"=>2, "over 100 miles"=>3}
  enum childhood_raisedby_other_than_parents_by_who: {"Grandparent(s)"=>0, "Aunt/Uncle"=>1, "Other relative"=>2, "Not a relative"=>3}

  def self.search(search)
    where("lower(first_name) || lower(last_name)  || phone_number LIKE ?", "%#{search.downcase}%")
  end

  def to_label
    "#{first_name} #{last_name}"
  end

end
