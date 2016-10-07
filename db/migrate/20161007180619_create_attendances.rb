class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :individual, foreign_key: true
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
