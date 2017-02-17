class ChangeGoalsDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :goals, :goal, :text
    
  end
end
