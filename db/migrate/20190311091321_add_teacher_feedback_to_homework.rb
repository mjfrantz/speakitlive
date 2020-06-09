class AddTeacherFeedbackToHomework < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :teacher_feedback, :text
  end
end
