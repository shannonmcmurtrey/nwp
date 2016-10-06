class RemoveChildhoodFromAssessments < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessments, :childhood_raisedby_other_than_parents
    remove_column :assessments, :childhood_raisedby_other_than_parents_length_in_months
    remove_column :assessments, :childhood_raisedby_other_than_parents_by_who
    remove_column :assessments, :childhood_residence_away_from_family
    remove_column :assessments, :childhood_residence_away_from_family_length_in_months
    remove_column :assessments, :childhood_swore_at_or_put_down
    remove_column :assessments, :childhood_made_to_feel_afraid_of_injury
    remove_column :assessments, :childhood_pushed_shoved_grabbed_slapped
    remove_column :assessments, :childhood_hit_hard
    remove_column :assessments, :childhood_lived_with_alcoholic
    remove_column :assessments, :childhood_lived_with_drug_user
    remove_column :assessments, :childhood_lived_with_depressed_or_mentally_ill
    remove_column :assessments, :childhood_lived_with_member_who_attempted_suicide
    remove_column :assessments, :childhood_lived_with_member_went_to_jail
    remove_column :assessments,:childhood_jailed_family_member_which
    remove_column :assessments, :childhood_caregiver_was_pushed_shoved_grabbed_slapped
    remove_column :assessments, :childhood_caregiver_bitten_or_hit
    remove_column :assessments, :childhood_caregiver_hit_repeatedly
    remove_column :assessments, :childhood_caregiver_threatened_with_weapon
  end
end
