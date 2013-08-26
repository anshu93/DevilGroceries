class Cutoffint < ActiveRecord::Migration
  def change
  	remove_column :orders, :cutoff
  	add_column :orders, :cutoff, :integer
  end
end
