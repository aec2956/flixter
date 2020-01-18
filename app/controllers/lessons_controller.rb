class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_be_enrolled
  def show
  end

  private

  def require_user_be_enrolled
    if !current_user.enrolled_in?(current_lesson.section.course)
        redirect_to course_path(current_lesson.section.course), alert: 'You are not enrolled in this course. You must enroll before you can view the lessons!'
    end
  end



   helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end


end

