class AddQuantityToOrderitemrelation < ActiveRecord::Migration
  def change
    add_column :orderitemrelations, :quantity, :integer
  end
end
