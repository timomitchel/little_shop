class ChangeImageToString < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :image, :string, default: "tea_v_coffee.jpg"
  end
end
