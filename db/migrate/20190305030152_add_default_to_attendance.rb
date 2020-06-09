class AddDefaultToAttendance < ActiveRecord::Migration[5.2]
  def change
    change_column_default :attendances, :presence, true
  end
end
