class CreateEasts < ActiveRecord::Migration
  def change
    create_table :easts do |t|
      t.string :dorm
      t.string :neighbourhood
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
