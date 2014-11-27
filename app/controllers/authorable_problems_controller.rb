class AuthorableProblemsController < ApplicationController
  def view_current_user
  end

  def view
    @auth_problems = AuthorableProblem.all
  end
  
  def create
  end
  
  def edit
    @auth_problem = AuthorableProblem.find(params[:id])
  end
  
  def update
    auth_problem = AuthorableProblem.find(params[:id])
    auth_problem.problem_text = params[:authorable_problem][:problem_text]
    auth_problem.save
    redirect_to edit_problem_path
  end
end
