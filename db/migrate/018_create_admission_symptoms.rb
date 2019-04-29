class CreateAdmissionSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :admission_symptoms do |t|
      t.references :admission
      t.references :symptom
      t.timestamps
    end
  end
end
