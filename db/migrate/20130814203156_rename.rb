class Rename < ActiveRecord::Migration
  def change
  	rename_table :east_schedules, :schedule
  end
end
