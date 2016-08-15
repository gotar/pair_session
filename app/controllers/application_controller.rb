class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    redirect_to(login_path, alert: 'Login required') unless admin?
  end

  def admin?
    session[:admin] ||= false
  end

  def admin_user
    ENV.fetch('user', 'admin')
  end

  def admin_password
    ENV.fetch('password', 'admin123')
  end
end
