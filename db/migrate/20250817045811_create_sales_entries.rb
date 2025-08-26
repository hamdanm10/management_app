class CreateSalesEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_entries do |t|
      t.string :sale_code, null: false
      t.timestamp :sale_at, null: false

      t.timestamps
    end

    add_index :sales_entries, :sale_code, unique: true
  end
end
