class UsersController < ApplicationController

  before_action :require_current_user, only: [:show]

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

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :fullname, :address, :state)
  end


end
