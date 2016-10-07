class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :topic
      t.date :meeting_date
      t.belongs_to :cohort, foreign_key: true

      t.timestamps
    end
  end
end
