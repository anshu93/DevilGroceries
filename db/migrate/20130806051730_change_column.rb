class ChangeColumn < ActiveRecord::Migration
  def change
  	remove_column :item, :unit_id
  end
end
