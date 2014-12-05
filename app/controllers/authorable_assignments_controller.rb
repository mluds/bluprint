class AuthorableAssignmentsController < ApplicationController
  layout 'table'

  def view_current_user
    @title = 'Author Assignments'
    @empty = "You haven't authored any assignments."
    @collection = current_user.authorable_assignments
    render :view
  end

  def view
    @title = 'Manage Assignments'
    @empty = 'No assignments have been authored.'
    @collection = AuthorableAssignment.all
  end
end
