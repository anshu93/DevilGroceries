class Changedatetime < ActiveRecord::Migration
  def change
  	change_column :Orders, :time, :string
  	change_column :Orders, :date, :string
  end
end
