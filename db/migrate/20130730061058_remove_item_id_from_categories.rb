class RemoveItemIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :item_id, :string
  end
end
