class AddDeliveryDateToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :delivery_date, :string
  end
end
