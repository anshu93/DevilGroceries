class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :unit_name

      t.timestamps
    end
  end
end
