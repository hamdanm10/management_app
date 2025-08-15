class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.timestamp :expense_at, null: false
      t.decimal :total_price, precision: 12, scale: 2, null: false, default: 0.00

      t.timestamps
    end
  end
end
