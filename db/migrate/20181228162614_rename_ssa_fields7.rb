class RenameSsaFields7 < ActiveRecord::Migration[5.2]
  def change
  	rename_column :assessments, :family_best_description_current_situation_mental_health, :ssa_family_best_description_current_situation_mental_health
  end
end
