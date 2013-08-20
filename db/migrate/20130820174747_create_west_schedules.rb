class CreateWestSchedules < ActiveRecord::Migration
  def change
    create_table :west_schedules do |t|
      t.string :dorm
      t.string :delivery_person
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
