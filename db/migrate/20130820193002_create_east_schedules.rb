class CreateEastSchedules < ActiveRecord::Migration
  def change
    create_table :east_schedules do |t|
      t.string :dorm
      t.string :delivery_person
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
