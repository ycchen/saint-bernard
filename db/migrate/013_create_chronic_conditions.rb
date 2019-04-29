class CreateChronicConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :chronic_conditions do |t|
      t.references :patient
      t.references :diagnosis
      t.timestamps
    end
  end
end
