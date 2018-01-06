class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      unless current_user.admin?
        redirect_to dashboard_path
      else
        redirect_to admin_dashboard_path
      end
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
