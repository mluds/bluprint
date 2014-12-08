class AssignmentsController < ApplicationController
  layout 'table'
  before_action :authenticate_user!

  def view_current_user
    @title = "My Assignments"
    @empty = "You haven't been assigned anything."
    @collection = current_user.assignments
  end

  def view
    assign = Assignment.find(params[:id])
    @title = assign.authorable_assignment.title
    @collection = assign.problems
  end

  def create
    redirect_to :back
  end
end
