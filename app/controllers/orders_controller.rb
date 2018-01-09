class OrdersController < ApplicationController
  before_action :require_current_user, only: [:index, :show]

  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(user_id: params[:user_id])
    if order.save && session[:cart] != nil && !session[:cart].empty?
      flash[:success] = "#{order.id} created successfully!"
      order.cart_assignment(session[:cart])
      session[:cart].clear
      redirect_to user_orders_path(current_user)
    else
      flash[:error] = "Please add items to your cart before checking out"
      redirect_to cart_path
    end
  end





end
