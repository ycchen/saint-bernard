class CreateAdmissionDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :admission_diagnoses do |t|
      t.references :admission
      t.references :diagnosis
      t.timestamps
    end
  end
end
