class RenameSsaFields2 < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :ssa_title_of_degree, :string
    rename_column :assessments, :family_best_description_current_situation_income, :ssa_family_best_description_current_situation_income
    rename_column :assessments, :health_insurance, :ssa_health_insurance
    rename_column :assessments, :health_insurance_primary, :ssa_health_insurance_primary
    rename_column :assessments, :health_insurance_primary_other, :ssa_health_insurance_primary_other
    rename_column :assessments, :health_insurance_children, :ssa_health_insurance_children
    rename_column :assessments, :health_insurance_children_other, :ssa_health_insurance_children_other
  end
end
