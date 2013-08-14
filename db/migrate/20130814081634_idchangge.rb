class Idchangge < ActiveRecord::Migration
  def change
  	  rename_column :orders, :dorm_id, :building
  end
end
