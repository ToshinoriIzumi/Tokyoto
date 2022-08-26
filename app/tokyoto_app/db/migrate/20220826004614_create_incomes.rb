class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :money, null: false, unique: true
      t.integer :is_myself, null: false, default: 0

      t.timestamps
    end
  end
end
