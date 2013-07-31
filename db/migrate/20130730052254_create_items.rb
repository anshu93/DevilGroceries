class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :selling_price
      t.decimal :supply_price
      t.decimal :duke_price
      t.string :unit
      t.string :category
      t.string :subcategory
      t.string :image
      t.string :active

      t.timestamps
    end
  end
end
