class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.string :coding_system, null: false
      t.string :code, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
