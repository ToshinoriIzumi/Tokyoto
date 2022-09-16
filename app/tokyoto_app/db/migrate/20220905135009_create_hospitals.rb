class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
