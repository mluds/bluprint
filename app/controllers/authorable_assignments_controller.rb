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

  def edit
    auth_assign = AuthorableAssignment.find(params[:id])
    @title = auth_assign.title
    @collection = auth_assign.auth_probs
    render 'authorable_problems/view'
  end

  def delete
    redirect_to :back
  end
end
