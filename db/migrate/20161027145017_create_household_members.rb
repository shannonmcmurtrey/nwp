class CreateHouseholdMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :household_members do |t|
      t.references :individual, foreign_key: true
      t.string :name
      t.string :relationship
      t.float :age
      t.string :school
      t.string :care_provider

      t.timestamps
    end
  end
end
