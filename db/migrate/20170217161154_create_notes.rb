class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :individual, foreign_key: true
      t.references :user, foreign_key: true
      t.date :note_date
      t.string :method_of_contact
      t.string :contact_length
      t.string :update_on_last_action
      t.string :needs_addressed
      t.string :other_notes
      t.date :next_appointment

      t.timestamps
    end
  end
end
