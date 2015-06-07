class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if request.xhr?
      render :json => ['You are not authorised to do that.'], :status => :unprocessable_entity
    else
      redirect_to main_app.root_url, :alert => exception.message
    end
  end
end
