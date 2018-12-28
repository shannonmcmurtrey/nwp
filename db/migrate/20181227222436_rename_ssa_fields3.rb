class RenameSsaFields3 < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :ssa_health_insurance_type, :string
    rename_column :assessments, :medical_physical_family_member_impact, :ssa_medical_physical_family_member_impact
    rename_column :assessments, :family_best_description_current_situation_mental_health, :ssa_family_best_description_current_situation_mental_health
    rename_column :assessments, :primary_adult_enrolled_best_description_stressors, :ssa_primary_adult_enrolled_best_description_stressors
    rename_column :assessments, :primary_adult_enrolled_parenting, :ssa_primary_adult_enrolled_parenting
    rename_column :assessments, :SS_quality_childcare, :ssa_quality_childcare
    rename_column :assessments, :ss_criminal, :ssa_criminal
    add_column :assessments, :ssa_legal_non_criminal, :integer
    add_column :assessments, :ssa_support_system, :integer
    add_column :assessments, :ssa_food, :integer
    add_column :assessments, :ssa_home_safety, :integer
  end
end
