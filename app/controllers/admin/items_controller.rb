class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "You created the #{@item.title}!"
      redirect_to items_path
    else
        render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end
end
