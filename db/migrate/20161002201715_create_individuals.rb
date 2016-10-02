class CreateIndividuals < ActiveRecord::Migration[5.0]
  def change
    create_table :individuals do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :mobile_phone_number
      t.string :email_address
      t.date :DOB
      t.date :start_date
      t.boolean :us_citizen
      t.string :non_us_citizen
      t.integer :ethnicity
      t.string :ethnicity_other
      t.string :lanuage_primary
      t.string :language_other
      t.boolean :springfield_native
      t.string :springfield_native_neighborhood
      t.integer :springfield_non_native_population
      t.integer :neighborhood_resident_length_in_months
      t.integer :springfield_non_native_distance
      t.belongs_to :cohort, foreign_key: true

      t.timestamps
    end
  end
end
