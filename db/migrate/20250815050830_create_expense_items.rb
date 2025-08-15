class CreateExpenseItems < ActiveRecord::Migration[8.0]
  def change
    create_table :expense_items do |t|
      t.references :expense, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.decimal :unit_price, precision: 12, scale: 2, null: false, default: 0.00
      t.integer :quantity, null: false
      t.references :unit_type, null: false, foreign_key: true, index: true
      t.decimal :total_price, precision: 12, scale: 2, null: false, default: 0.00
      t.text :note, null: true

      t.timestamps
    end
  end
end
