class AddReligiousMembershipToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :member_of_religious_group, :boolean
  end
end
