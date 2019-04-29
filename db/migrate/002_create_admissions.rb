class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.references :patient
      t.timestamp :moment, null: false
      t.timestamps
    end
  end
end
