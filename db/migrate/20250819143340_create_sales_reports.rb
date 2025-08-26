class CreateSalesReports < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_reports do |t|
      t.references :sale, null: false, foreign_key: true, index: true
      t.decimal :cost_price, precision: 12, scale: 2, null: false, default: 0.00
      t.decimal :selling_price, precision: 12, scale: 2, null: false, default: 0.00
      t.integer :sold_quantity, null: false
      t.integer :unsold_quantity, null: false
      t.integer :waste_quantity, null: false
      t.decimal :total_revenue, precision: 12, scale: 2, null: false, default: 0.00
      t.decimal :total_profit, precision: 12, scale: 2, null: false, default: 0.00
      t.decimal :total_loss, precision: 12, scale: 2, null: false, default: 0.00

      t.timestamps
    end
  end
end
