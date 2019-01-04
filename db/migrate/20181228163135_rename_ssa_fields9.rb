class RenameSsaFields9 < ActiveRecord::Migration[5.2]
  def change
  	rename_column :assessments, :primary_adult_enrolled_parenting, :ssa_primary_adult_enrolled_parenting
  end
end
