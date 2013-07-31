class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :campus
      t.string :building
      t.string :room
      t.string :email
      t.string :phone
      t.integer :order_id
      t.date :date
      t.time :time
      t.string :status

      t.timestamps
    end
  end
end
