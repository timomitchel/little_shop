class AddCategoryToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :category, foreing_key: true
  end
end
