class HomeController < ApplicationController
  def home
    redirect_to my_assignments_path
  end
end
