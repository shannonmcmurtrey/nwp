class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :website
      t.string :primary_contact

      t.timestamps
    end
  end
end
