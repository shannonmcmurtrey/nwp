class RenameSsaFields5 < ActiveRecord::Migration[5.2]
  def change
  	add_column :assessments, :ssa_health_insurance_type, :string
  end
end
