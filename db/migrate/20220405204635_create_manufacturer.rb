class CreateManufacturer < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :manufacturer_items
      t.timestamps 
    end
  end
end
