class CreatePatientTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_treatments do |t|
      t.references :patient
      t.references :treatment
      t.timestamps
    end
  end
end
