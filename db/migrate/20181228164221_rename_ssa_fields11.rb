class RenameSsaFields11 < ActiveRecord::Migration[5.2]
  def change
  	add_column :assessments, :ssa_quality_childcare, :integer
  end
end
