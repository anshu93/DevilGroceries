class CreateDorms < ActiveRecord::Migration
  def change
    create_table :dorms do |t|
      t.string :dorm_name
      t.integer :campus_id

      t.timestamps
    end
  end
end
