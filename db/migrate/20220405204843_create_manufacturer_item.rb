class CreateManufacturerItem < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturer_items do |t|
      t.references :manufacturer, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
