class UsersController < ApplicationController
  def view_current_user
    @students = current_user.students
  end
  
  def remove_student
    instructor = User.find(params[:i_id])
    student = User.find(params[:s_id])
    instructor.students.destroy(student)
    redirect_to :back
  end

  def view_students
  end

  def view_instructors
  end
end
