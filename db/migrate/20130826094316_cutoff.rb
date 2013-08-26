class Cutoff < ActiveRecord::Migration
  def change
  	add_column :orders, :cutoff, :string
  end
end
