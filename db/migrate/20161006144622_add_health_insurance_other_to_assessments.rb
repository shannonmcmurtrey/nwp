class AddHealthInsuranceOtherToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :health_insurance_primary_other, :string
    add_column :assessments, :health_insurance_children_other, :string
    add_column :assessments, :health_insurance_spouse_or_significant_other_other, :string
  end
end
