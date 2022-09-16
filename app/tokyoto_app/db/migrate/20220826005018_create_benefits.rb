class CreateBenefits < ActiveRecord::Migration[6.0]
  def change
    create_table :benefits do |t|
      t.integer :money, unique: true

      t.timestamps
    end
  end
end
