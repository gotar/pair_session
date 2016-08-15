class SessionController < ApplicationController
  before_action :authenticate, only: [:logout]

  def login
  end

  def create
    if session_params[:user] == admin_user && session_params[:password] == admin_password
      session[:admin] = true
      redirect_to blog_articles_path, notice: 'Welcome Admin'
    else
      redirect_to login_path, alert: 'Invalid user or password!'
    end
  end

  def logout
    session[:admin] = false
    redirect_to root_path, notice: 'Logged out'
  end

  private
  def session_params
    params.require(:session).permit(:user, :password)
  end
end
