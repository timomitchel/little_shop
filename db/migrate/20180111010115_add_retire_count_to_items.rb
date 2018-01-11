class AddRetireCountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :retire_count, :integer, default: 0
  end
end
