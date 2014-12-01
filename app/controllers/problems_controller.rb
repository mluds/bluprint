class ProblemsController < ApplicationController
  def edit
    @problem = Problem.find(params[:id])
  end
end
