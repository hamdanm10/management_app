class CreateSupplies < ActiveRecord::Migration[8.0]
  def change
    create_table :supplies do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.references :unit_type, null: false, foreign_key: true, index: true
      t.text :note, null: true
      
      t.timestamps
    end
  end
end
