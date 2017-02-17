class ChangeNotesDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :update_on_last_action, :text
    change_column :notes, :needs_addressed, :text
    change_column :notes, :other_notes, :text
  end
end
