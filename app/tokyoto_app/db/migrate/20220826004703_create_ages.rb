class CreateAges < ActiveRecord::Migration[6.0]
  def change
    create_table :ages do |t|
      t.integer :min, null: false
      t.integer :max, null: false

      t.timestamps
    end
    add_index :ages, [:min, :max], unique: true
  end
end
