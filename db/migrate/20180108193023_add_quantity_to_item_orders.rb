class AddQuantityToItemOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :item_orders, :quantity, :decimal
  end
end
