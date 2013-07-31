class RemoveItemIdFromSubcategories < ActiveRecord::Migration
  def change
    remove_column :subcategories, :item_id, :string
  end
end
