class AddPresentToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :present, :boolean
  end
end
