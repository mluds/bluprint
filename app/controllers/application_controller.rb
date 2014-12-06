class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def render *args
    paginate_collection
    super
  end

  private

  def paginate_collection
    if send(:_layout) == 'table' and @collection
      @collection = @collection.paginate(page: params[:page])
    end
  end
end
