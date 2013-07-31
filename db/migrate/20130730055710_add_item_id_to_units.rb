class AddItemIdToUnits < ActiveRecord::Migration
  def change
    add_column :units, :item_id, :string
  end
end
