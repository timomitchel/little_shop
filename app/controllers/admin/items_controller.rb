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
      redirect_to admin_items_path
    else
        render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:success] = "#{@item.title} updated!"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def retire
    item = Item.find(params[:item_id])
    if params[:update_status] == "Inactive"
      item.update(status: 0)
      redirect_to admin_items_path
    elsif params[:update_status] == "Active"
      item.update(status: 1)
      redirect_to admin_items_path
    else
      flash[:error] = "The Item could not be updated"
      redirect_to admin_items_path
    end

  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id, :status)
  end
end
