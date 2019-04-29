class CreateAdmissionObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :admission_observations do |t|
      t.references :admission
      t.references :observation
      t.timestamps
    end
  end
end
