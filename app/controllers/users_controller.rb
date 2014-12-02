class UsersController < ApplicationController
  def view_current_user
    @users = current_user.students
    render :view
  end

  def remove_student
    instructor = User.find(params[:i_id])
    student = User.find(params[:s_id])
    instructor.students.destroy(student)
    redirect_to :back
  end

  def view_students
    @users = User.all
    render :view
  end

  def view_instructors
    @users = User.all
    render :view
  end
end
