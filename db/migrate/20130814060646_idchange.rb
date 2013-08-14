class Idchange < ActiveRecord::Migration
  def change
  	rename_column :orders, :campus, :campus_id
  	rename_column :orders, :building, :dorm_id
  end
end
