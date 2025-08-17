class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :cost_price, precision: 12, scale: 2, null: false, default: 0.00
      t.decimal :selling_price, precision: 12, scale: 2, null: false, default: 0.00

      t.timestamps
    end
  end
end
