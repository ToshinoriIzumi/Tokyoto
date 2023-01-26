class AddUrlColumnAndPhoneNumberColumnToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :url, :string
    add_column :hospitals, :phone_number, :string
  end
end
