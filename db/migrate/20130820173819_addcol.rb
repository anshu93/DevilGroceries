class Addcol < ActiveRecord::Migration
  def change
  	add_column :easts, :room, :string
  end
end
