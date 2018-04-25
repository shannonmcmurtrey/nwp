class RemoveFieldsFromIndividual < ActiveRecord::Migration[5.0]
  def change
  	remove_column :individuals, :childhood_caregiver_threatened_with_weapon
  end
end
