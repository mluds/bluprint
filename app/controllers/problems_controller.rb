class ProblemsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @problem = Problem.find(params[:id])
  end
end
