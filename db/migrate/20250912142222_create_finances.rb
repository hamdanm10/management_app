class CreateFinances < ActiveRecord::Migration[8.0]
  def change
    create_table :finances do |t|
      t.decimal :production_cost, precision: 12, scale: 2, null: false, default: 0.00
      t.decimal :net_profit, precision: 12, scale: 2, null: false, default: 0.00

      t.timestamps
    end
  end
end
