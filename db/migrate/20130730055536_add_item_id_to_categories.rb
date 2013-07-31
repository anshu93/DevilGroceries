class AddItemIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :item_id, :string
  end
end
