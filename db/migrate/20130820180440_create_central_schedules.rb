class CreateCentralSchedules < ActiveRecord::Migration
  def change
    create_table :central_schedules do |t|
      t.string :street
      t.string :delivery_person
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
