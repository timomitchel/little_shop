class Admin::AnalyticsController < Admin::BaseController

  def show
    @categories = Category.all
  end

end
