class Admin::UsersController < Admin::BaseController


  def show
     if params[:type] == "ordered"
      @orders = Order.ordered
     elsif params[:type] == "paid"
      @orders = Order.paid
     elsif params[:type] == "cancelled"
      @orders = Order.cancelled
     elsif params[:type] == "completed"
      @orders = Order.completed
     else
      @orders = Order.all
     end
  end

  def destroy
    order = Order.find(params[:order_id])
    order.destroy
    redirect_to admin_dashboard_path
  end

  def edit

  end

  def update
    if params[:update_type] == "complete"
      order = Order.find(params[:order_id])
      order.update_status_complete
      redirect_to admin_dashboard_path
    elsif params[:update_type] == "paid"
      order = Order.find(params[:order_id])
      order.update_status_paid
      redirect_to admin_dashboard_path
    else
      current_user.update(user_params)
      redirect_to admin_dashboard_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :password, :fullname, :address)
    end
end
