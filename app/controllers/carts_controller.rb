class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    item = Item.find(params[:item_id])

    session[:cart] ||= Hash.new(0)
    session[:cart][item.id.to_s] = session[:cart][item.id.to_s] + 1
    flash[:notice] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)} in your cart!"

    redirect_to items_path
  end

end
