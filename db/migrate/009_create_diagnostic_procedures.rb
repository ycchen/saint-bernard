class CreateDiagnosticProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnostic_procedures do |t|
      t.text :description, null: false
      t.timestamp :moment, null: false
      t.timestamps
    end
  end
end
