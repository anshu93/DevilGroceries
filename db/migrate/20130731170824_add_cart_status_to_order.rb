class AddCartStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :cart_status, :string
  end
end
