class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def render *args
    paginate
    super
  end

  private

  def paginate
    if send(:_layout) == 'table' and @collection
      @collection = @collection.page(params[:page])
    end
  end
end
