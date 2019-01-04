class AssessmentNewFields < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :voter, :string
  end
end
