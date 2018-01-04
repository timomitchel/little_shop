class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)} in your cart!"

    redirect_to items_path
  end

  def show
    @items = Item.where(id: @cart.contents.keys)
  end

  def destroy
    @item = Item.find(params[:item_id])
    flash[:success] = "Successfully removed #{@item.title} from your cart!"
    @cart.subtract_item(@item.id)
    session[:cart] = @cart.contents
    @item.destroy
    redirect_to cart_path
  end

end
