class Removecutoff < ActiveRecord::Migration
  def change
  	remove_column :orders, :cutoff
  end
end
