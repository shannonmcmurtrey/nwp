class AddlastSixMonthsBeenInHomeOfSomeoneFromDifferentNeighborhoodToAssessment < ActiveRecord::Migration[5.0]
  def change
  	add_column :assessments, :last_six_months_been_in_home_of_someone_from_different_neighborhood, :boolean
  end
end
