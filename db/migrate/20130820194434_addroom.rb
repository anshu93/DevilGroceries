class Addroom < ActiveRecord::Migration
  def change
  	add_column :east_schedules, :room, :string
  end
end
