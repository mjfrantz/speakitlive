class AttendancesController < ApplicationController

  def create
    @attendance = Attendance.new
    @attendance.lesson = Lesson.find(params[:lesson_id])
    @attendance.student = current_student

    if @attendance.save
      redirect_to lesson_path(@attendance.lesson_id)
    else
      raise
    end

  rescue ActiveRecord::RecordNotUnique
    redirect_to lesson_path(@attendance.lesson)      
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @lesson = @attendance.lesson
    if @attendance.destroy!
      redirect_to lesson_path(@lesson)
    else
      raise
    end
  end

  def unattend
    @attendance = Attendance.find(params[:id])
    @attendance.present = false
    @lesson = @attendance.lesson
    if @attendance.save!
      redirect_to lesson_path(@lesson)
    else
      raise
    end
  end

end
  