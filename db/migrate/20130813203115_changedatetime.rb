class Changedatetime < ActiveRecord::Migration
  def change
  	change_column :order, :time, :string
  	change_column :order, :date, :string
  end
end
