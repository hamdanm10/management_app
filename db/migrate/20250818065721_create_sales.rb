class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :sales_entry, null: false, foreign_key: true, index: true
      t.references :sales_channel, null: false, foreign_key: true, index: true
      t.references :product, null: false, foreign_key: true, index: true
      t.integer :quantity, null: false
      t.text :note, null: true

      t.timestamps
    end
  end
end
