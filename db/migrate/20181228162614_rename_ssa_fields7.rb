class RenameSsaFields7 < ActiveRecord::Migration[5.2]
  def change
  	add_column :assessments, :ssa_family_best_description_current_situation_mental_health, :integer
  end
end
