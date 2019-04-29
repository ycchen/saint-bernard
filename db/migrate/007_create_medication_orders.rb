class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
      t.string :name, null: false
      t.integer :unit, null: false
      t.decimal :dosage, null: false
      t.integer :route
      t.references :frequency
      t.text :necessity, null: false
      t.timestamps
    end
  end
end
