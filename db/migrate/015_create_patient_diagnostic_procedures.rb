class CreatePatientDiagnosticProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnostic_procedures do |t|
      t.references :patient
      t.references :diagnostic_procedure
      t.timestamps
    end
  end
end
