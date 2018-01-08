class Admin::UsersController < Admin::BaseController
  def show
    @orders = Order.all
  end

  def destroy
    order = Order.find(params[:order_id])
    order.delete
    redirect_to admin_dashboard_path
  end

  def update
    order = Order.find(params[:order_id])
    if params[:update_type] == "complete"    
      order.update_status_complete
      redirect_to admin_dashboard_path
    elsif params[:update_type] == "paid"
      order.update_status_paid
      redirect_to admin_dashboard_path
    else
      flash[:error] = "could not update status"
      redirect_to admin_dashboard_path
    end
  end
end
