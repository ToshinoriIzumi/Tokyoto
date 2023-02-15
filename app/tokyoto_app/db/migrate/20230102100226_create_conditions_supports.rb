class CreateConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports do |t|
      t.references :condition, null: false, foreign_key: true
      t.references :support, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.integer :payment, null: false
      t.references :age, null: false, foreign_key: true
      t.string :url, null: false
      t.integer :payment_limit, default: 0
      t.integer :payment_frequency, default: 0
      t.string :payment_month
      t.string :transfer_destination

      t.timestamps
    end
  end
end
