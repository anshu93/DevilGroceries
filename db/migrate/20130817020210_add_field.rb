class AddField < ActiveRecord::Migration
  def change
  	add_column :items, :fresh, :string
  end
end
