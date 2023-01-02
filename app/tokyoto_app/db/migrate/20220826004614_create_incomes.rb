class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :money, null: false, index: {unique: true}
      t.integer :is_myself, default: 0

      t.timestamps
    end
    add_index :incomes, [:money, :is_myself], unique: true
  end
end
