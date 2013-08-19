class AddHouseToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :house, :string
  end
end
