class CreateApplicationMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :application_methods do |t|
      t.string :application_method, null: false
      t.integer :method_order, null: false, default: 0

      t.timestamps
    end
  end
end
