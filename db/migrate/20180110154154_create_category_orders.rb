class CreateCategoryOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :category_orders do |t|
      t.references :category, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
