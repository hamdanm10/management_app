class CreateUnitTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :unit_types do |t|
      t.string :name, null: false
      t.text :note, null: true

      t.timestamps
    end
  end
end
