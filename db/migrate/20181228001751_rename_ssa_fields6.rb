class RenameSsaFields6 < ActiveRecord::Migration[5.2]
  def change
  	add_column :assessments, :ssa_medical_physical_family_member_impact, :integer
  end
end