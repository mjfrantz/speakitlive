class AddStudentAToTimeTrials < ActiveRecord::Migration[5.2]
  def change
    add_column :time_trials, :attendance_a_id, :bigint, index: true
    add_column :time_trials, :attendance_b_id, :bigint, index: true
  end
end
