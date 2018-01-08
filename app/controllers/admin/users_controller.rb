class Admin::UsersController < Admin::BaseController
  def show
    @orders = Order.all
  end
end
