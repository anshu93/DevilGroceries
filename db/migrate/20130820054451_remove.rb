class Remove < ActiveRecord::Migration
  def change
  	remove_column :orders, :delivery_date
  end
end
