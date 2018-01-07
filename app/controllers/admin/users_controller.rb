class Admin::UsersController < Admin::BaseController

  def show

  end

  def edit

  end

  def update
    current_user.update(user_params)

    redirect_to admin_dashboard_path
  end


  private

    def user_params
      params.require(:user).permit(:username, :password, :fullname, :address)
    end
end
