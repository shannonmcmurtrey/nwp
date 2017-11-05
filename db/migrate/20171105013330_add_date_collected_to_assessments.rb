class AddDateCollectedToAssessments < ActiveRecord::Migration[5.0]
  def change
      add_column :assessments, :date_collected, :date
  end
end
