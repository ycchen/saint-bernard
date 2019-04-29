class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :order_frequencies do |t|
      t.string :value, null: false
      t.integer :frequency_unit
      t.timestamps
    end
  end
end
