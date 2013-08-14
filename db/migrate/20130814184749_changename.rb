class Changename < ActiveRecord::Migration
  def change
  	rename_column :orders, :campus_id, :campus
  end
end
