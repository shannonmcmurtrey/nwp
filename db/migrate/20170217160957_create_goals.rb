class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.references :individual, foreign_key: true
      t.string :goal
      t.date :goal_start
      t.date :goal_finish
      t.float :completion_percentage

      t.timestamps
    end
  end
end
