class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.references :facility
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :mr, null: false
      t.timestamp :dob, null: false
      t.integer :gender, null: false
      t.timestamps
    end
  end
end
