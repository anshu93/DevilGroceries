class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :items, :subcategory, :subcategory_id
  end
end
