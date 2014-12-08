class AuthorableProblemsController < ApplicationController
  layout 'table'

  def view_current_user
    @title = 'Author Problems'
    @collection = current_user.authorable_problems
    render :view
  end

  def view
    @title = 'Manage Problems'
    @collection = AuthorableProblem.all
  end

  def new
    @auth_problem = AuthorableProblem.new
    @submit_url = create_auth_problem_path
    @submit_text = 'Create'
    render :edit, layout: 'application'
  end

  def create
    auth_problem = AuthorableProblem.new
    auth_problem.user = current_user
    auth_problem.problem_text = params[:authorable_problem][:problem_text]
    if auth_problem.save
      flash[:notice] = 'Problem created'
      redirect_to edit_problem_path(id: auth_problem.id)
    else
      flash[:alert] = auth_problem.errors.full_messages.first
      redirect_to new_auth_problem_path
    end
  end

  def edit
    @auth_problem = AuthorableProblem.find(params[:id])
    @submit_url = update_problem_path
    @submit_text = "Update"
    render layout: "application"
  end

  def update
    auth_problem = AuthorableProblem.find(params[:id])
    auth_problem.problem_text = params[:authorable_problem][:problem_text]
    if auth_problem.save
      flash[:notice] = 'Problem saved'
    else
      flash[:alert] = auth_problem.errors.full_messages.first
    end
    redirect_to edit_problem_path
  end

  def delete
    auth_problem = AuthorableProblem.find(params[:id])
    if auth_problem.destroy
      flash[:notice] = "Problem deleted"
    else
      flash[:alert] = auth_problem.errors.full_messages.first
    end
    redirect_to :back
  end
end
