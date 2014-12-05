class AssignmentsController < ApplicationController
  layout 'table'
  before_action :authenticate_user!

  def view_current_user
    @title = "My Assignments"
    @empty = "You haven't been assigned anything."
    @collection = current_user.assignments
  end
end
