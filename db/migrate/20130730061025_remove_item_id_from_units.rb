class RemoveItemIdFromUnits < ActiveRecord::Migration
  def change
    remove_column :units, :item_id, :string
  end
end
