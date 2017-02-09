class AddBeenAtFriendsHomeToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :last_six_months_had_friends_in_home, :integer
  end
end
