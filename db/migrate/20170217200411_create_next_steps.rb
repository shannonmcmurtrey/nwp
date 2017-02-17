class CreateNextSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :next_steps do |t|
      t.references :goal, foreign_key: true
      t.string :next_step
      t.string :responsible_party
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
