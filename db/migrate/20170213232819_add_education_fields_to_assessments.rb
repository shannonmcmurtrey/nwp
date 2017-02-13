class AddEducationFieldsToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :highest_education_attained, :integer
    add_column :assessments, :last_grade_completed, :string
    add_column :assessments, :technical_training_degree, :string
    add_column :assessments, :associates_degree_type, :string
    add_column :assessments, :bachelors_degree_type, :string
    add_column :assessments, :masters_degree_type, :string
  end
end
