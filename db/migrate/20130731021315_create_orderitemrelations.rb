class CreateOrderitemrelations < ActiveRecord::Migration
  def change
    create_table :orderitemrelations do |t|
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end
end
