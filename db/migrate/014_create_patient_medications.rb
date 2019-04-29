class CreatePatientMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_medications do |t|
      t.references :patient
      t.references :medication_order
      t.timestamps
    end
  end
end
