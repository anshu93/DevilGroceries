class Adddelivre < ActiveRecord::Migration
  def change
  	add_column :orders, :delivery_date, :date
  end
end
