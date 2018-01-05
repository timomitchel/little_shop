class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

  def show
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
