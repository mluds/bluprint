class UsersController < ApplicationController
  layout 'table'

  def view_instructor_students
    if params[:id] == nil
      instructor = current_user
      name = 'My'
    else
      instructor = User.find(params[:id])
      name = instructor.name + "'s"
    end

    @title = name + ' Students'
    @collection = instructor.students
  end

  def view_students
    @title = 'Manage Students'
    @collection = User.all
  end

  def view_students_add
    @collection = User.all
    render :view_students, layout: 'table_ajax'
  end

  def view_instructors
    @title = 'Manage Instructors'
    @collection = User.where(role:User.roles[:instructor])
  end

  def add_student
    instructor = User.find(params[:i_id])
    student = User.find(params[:s_id])
    instructor.students << student
    redirect_to :back
  end

  def remove_student
    instructor = User.find(params[:i_id])
    student = User.find(params[:s_id])
    instructor.students.destroy(student)
    redirect_to :back
  end
end
