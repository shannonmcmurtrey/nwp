class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.date :start_date
      t.string :meeting_night
      t.string :meeting_time
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
