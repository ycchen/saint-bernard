class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.text :description, null: false
      t.text :necessity, null: false
      t.timestamps
    end
  end
end
