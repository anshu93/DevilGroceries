class RemoveOrderIdFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :order_id, :integer
  end
end
