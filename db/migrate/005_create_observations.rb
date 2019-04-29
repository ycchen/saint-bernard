class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.text :description, null: false
      t.timestamp :moment, null: false
      t.timestamps
    end
  end
end
