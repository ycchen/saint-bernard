class CreatePatientDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnoses do |t|
      t.references :patient
      t.references :diagnosis
      t.timestamps
    end
  end
end
