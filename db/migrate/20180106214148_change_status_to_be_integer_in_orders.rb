class ChangeStatusToBeIntegerInOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :status, 'integer USING CAST(status AS integer)'
  end
end
