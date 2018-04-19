class AddPrimaryAdultEnrolledParentingToAssessments < ActiveRecord::Migration[5.0]
  def change
      add_column :assessments, :primary_adult_enrolled_parenting, :integer
  end
end
