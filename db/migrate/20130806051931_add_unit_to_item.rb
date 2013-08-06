class AddUnitToItem < ActiveRecord::Migration
  def change
  	add_column :item, :unit, :string
  end
end
