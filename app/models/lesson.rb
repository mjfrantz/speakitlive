class Lesson < ApplicationRecord
  belongs_to :teacher
  has_many :attendances, dependent: :destroy
  has_many :time_trials
  has_many :mistakes, through: :time_trials
  has_many :homeworks, through: :mistakes
  validates :learning_goal, presence: true
  validates :time_goal, presence: true

  def student_time_trials(student)
    time_trials.where(
      attendance_a_id: student.attendances.pluck(:id)
    ).or(
      time_trials.where(
        attendance_b_id: student.attendances.pluck(:id)
      )
    )
  end
end
