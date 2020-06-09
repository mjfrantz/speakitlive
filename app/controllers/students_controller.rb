class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @lesson = Lesson.find(params[:lesson_id])
    @course = Course.find(@lesson.course_id)
    @attendances = Attendance.where(lesson_id: @lesson.id)
    @time_trials = TimeTrial.where(lesson_id: @lesson.id)
  end
end
