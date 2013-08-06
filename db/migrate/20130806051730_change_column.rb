class ChangeColumn < ActiveRecord::Migration
  def change
  	remove_column :items, :unit_id
  end
end
