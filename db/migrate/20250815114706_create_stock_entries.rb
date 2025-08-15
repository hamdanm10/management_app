class CreateStockEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_entries do |t|
      t.timestamp :entry_at, null: false

      t.timestamps
    end
  end
end
