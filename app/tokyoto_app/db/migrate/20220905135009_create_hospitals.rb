class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name, null: false
      t.float :latitude, index: {unique: true}
      t.float :longitude, index: {unique: true}
      t.string :address, null: false, index: {unique: true}
      t.timestamps
    end
  end
end
