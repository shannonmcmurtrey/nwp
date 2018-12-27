class RenameSsaFields < ActiveRecord::Migration[5.2]
  def change
  	rename_column :assessments, :family_best_description_current_situation_housing, :ssa_family_best_description_current_situation_housing
  	rename_column :assessments, :family_best_description_current_situation_transportation, :ssa_family_best_description_current_situation_transportation
  	rename_column :assessments, :primary_adult_enrolled_best_description_employment, :ssa_primary_adult_enrolled_best_description_employment
  	rename_column :assessments, :primary_adult_enrolled_best_description_academic, :ssa_primary_adult_enrolled_best_description_academic
    add_column :assessments, :ssa_highest_grade_completed, :integer
    add_column :assessments, :ssa_title_of_training, :string
  end
end
