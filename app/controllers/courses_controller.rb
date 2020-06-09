class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
    @lesson = Lesson.new
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.teacher = current_teacher

    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

   private

  def course_params
    params.require(:course).permit(:school, :name, :description)
  end
end
