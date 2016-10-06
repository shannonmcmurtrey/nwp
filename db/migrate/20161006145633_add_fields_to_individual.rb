class AddFieldsToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_column :individuals, :childhood_raisedby_other_than_parents, :integer
    add_column :individuals, :childhood_raisedby_other_than_parents_length_in_months, :integer
    add_column :individuals, :childhood_raisedby_other_than_parents_by_who, :integer
    add_column :individuals, :childhood_residence_away_from_family, :integer
    add_column :individuals, :childhood_residence_away_from_family_length_in_months, :integer
    add_column :individuals, :childhood_swore_at_or_put_down, :integer
    add_column :individuals, :childhood_made_to_feel_afraid_of_injury, :integer
    add_column :individuals, :childhood_pushed_shoved_grabbed_slapped, :integer
    add_column :individuals, :childhood_hit_hard, :integer
    add_column :individuals, :childhood_lived_with_alcoholic, :integer
    add_column :individuals, :childhood_lived_with_drug_user, :integer
    add_column :individuals, :childhood_lived_with_depressed_or_mentally_ill, :integer
    add_column :individuals, :childhood_lived_with_member_who_attempted_suicide, :integer
    add_column :individuals, :childhood_lived_with_member_went_to_jail, :integer
    add_column :individuals, :childhood_jailed_family_member_which, :string
    add_column :individuals, :childhood_caregiver_was_pushed_shoved_grabbed_slapped, :integer
    add_column :individuals, :childhood_caregiver_bitten_or_hit, :integer
    add_column :individuals, :childhood_caregiver_hit_repeatedly, :integer
    add_column :individuals, :childhood_caregiver_threatened_with_weapon, :integer
  end
end
