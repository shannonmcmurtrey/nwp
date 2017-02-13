class AddMaritalStatusToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :marital_status, :integer
  end
end
