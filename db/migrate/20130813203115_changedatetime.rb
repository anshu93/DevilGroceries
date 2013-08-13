class Changedatetime < ActiveRecord::Migration
  def change
  	change_column :orders, :time, :string
  	change_column :orders, :date, :string
  end
end
