class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
