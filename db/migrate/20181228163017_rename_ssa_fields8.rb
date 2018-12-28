class RenameSsaFields8 < ActiveRecord::Migration[5.2]
  def change
  	rename_column :assessments, :primary_adult_enrolled_best_description_stressors, :ssa_primary_adult_enrolled_best_description_stressors


  end
end
