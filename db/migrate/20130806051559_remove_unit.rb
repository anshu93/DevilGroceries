class RemoveUnit < ActiveRecord::Migration
  def change
  	drop_table :unit
  end
end
