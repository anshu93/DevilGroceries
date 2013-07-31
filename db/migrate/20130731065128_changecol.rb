class Changecol < ActiveRecord::Migration
  def change
  	rename_column :items, :category, :category_id
  	rename_column :items, :unit, :unit_id
  end
end
