class AddCategoryIdToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :category_id, :integer
  end
end
