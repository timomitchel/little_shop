class OrdersController < ApplicationController

  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(user_id: params[:user_id])
    if order.save
      flash[:success] = "#{order.id} created successfully!"
      order.cart_assignment(session[:cart])
      session[:cart].clear
      redirect_to user_orders_path(current_user)
    else
      flash[:error] = "You had an issue with your order"
      redirect_to cart_path
    end
  end





end
