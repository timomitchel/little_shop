class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_title(params[:id])
  end

end
