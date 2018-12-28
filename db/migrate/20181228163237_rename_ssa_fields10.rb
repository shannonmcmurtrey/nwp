class RenameSsaFields10 < ActiveRecord::Migration[5.2]
  def change
  	add_column :assessments, :ssa_criminal, :integer
  	add_column :assessments, :ssa_legal_non_criminal, :integer
  	add_column :assessments, :ssa_support_system, :integer
  	add_column :assessments, :ssa_food, :integer
  	add_column :assessments, :ssa_home_safety, :integer
  end
end
