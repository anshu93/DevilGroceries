class AddItemIdToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :item_id, :string
  end
end
