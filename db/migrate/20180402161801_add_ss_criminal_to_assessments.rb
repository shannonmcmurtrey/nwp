class AddSsCriminalToAssessments < ActiveRecord::Migration[5.0]
  def change
  	add_column :assessments, :ss_criminal, :integer
  end
end
