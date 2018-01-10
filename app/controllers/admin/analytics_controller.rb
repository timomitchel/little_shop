class Admin::AnalyticsController < Admin::BaseController

  def show
    @orders = Order.organize_states
    @categories = Category.all
  end

  def update
    @categories = Category.all
    @orders = Order.sort_states
    render :show
  end
end
