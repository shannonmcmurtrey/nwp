class AddAceFields < ActiveRecord::Migration[5.0]
  def change
      add_column :individuals, :ACE_sexually_abused, :integer
      add_column :individuals, :ACE_unloved, :integer
      add_column :individuals, :ACE_uncared_for, :integer
      add_column :individuals, :ACE_broken_home, :integer
      add_column :individuals, :ACE_mother_pushed_shoved_grabbed_slapped, :integer
      add_column :individuals, :ACE_lived_with_addict, :integer
      add_column :individuals, :ACE_household_member_mentally_ill, :integer
      add_column :individuals, :ACE_household_member_went_to_prison, :integer

      rename_column :individuals, :childhood_swore_at_or_put_down, :ACE_swore_at_or_put_down
      rename_column :individuals, :childhood_pushed_shoved_grabbed_slapped, :ACE_pushed_shoved_grabbed_slapped

  end
end
