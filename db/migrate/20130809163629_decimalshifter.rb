class Decimalshifter < ActiveRecord::Migration
  def change
  	add_column :items, :selling_price2, :decimal, :precision => 8 , :scale => 2
	execute "UPDATE items SET selling_price2 = selling_price"
	remove_column :items, :selling_price
	rename_column :items, :selling_price2, :selling_price
  end
end
