class AddSsQualityChildcareToAssessments < ActiveRecord::Migration[5.0]
  def change
      add_column :assessments, :SS_quality_childcare, :integer
  end
end
