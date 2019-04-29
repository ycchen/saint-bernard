class CreatePatientAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_allergies do |t|
      t.references :patient
      t.references :allergy
      t.timestamps
    end
  end
end
