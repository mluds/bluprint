class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def view_current_user
    @assignments = current_user.assignments
  end
end
