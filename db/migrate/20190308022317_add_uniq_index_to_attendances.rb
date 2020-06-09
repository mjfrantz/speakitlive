class AddUniqIndexToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_index :attendances, [:lesson_id, :student_id], unique: true
  end
end
