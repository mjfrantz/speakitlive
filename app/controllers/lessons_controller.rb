class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
    @attendances = Attendance.where(lesson_id: @lesson.id)
    @time_trials = TimeTrial.where(lesson_id: @lesson.id)
  end

  def new
    @lesson = Lesson.new(course_id: params[:course_id])
    @course = Course.find(params[:course_id])
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.teacher = current_teacher
    @lesson.course_id = params[:course_id]
    if @lesson.save!
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def update
  end

  private

  def lesson_params
    params.require(:lesson).permit( :learning_goal, :start_time, :time_goal, :teacher_id, :course_id)
  end
end

