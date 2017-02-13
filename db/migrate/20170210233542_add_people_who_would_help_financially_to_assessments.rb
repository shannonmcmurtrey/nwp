class AddPeopleWhoWouldHelpFinanciallyToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :number_of_people_help_financially, :integer
  end
end
