class AddConvictedOfCrimeToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :convicted_of_crime_last_six_months, :boolean
  end
end
