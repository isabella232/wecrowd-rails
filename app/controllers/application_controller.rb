class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  include UserHelper
  include ErrorHelper


  protected

  def login_user(user)
    session[:user_id] = user.id
  end

end
