class RemoveOrderIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :order_id, :integer
  end
end
