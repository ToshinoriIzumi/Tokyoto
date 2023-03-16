class AddIndexIncomesColumn < ActiveRecord::Migration[6.0]
  def change
    add_index :incomes, [:min, :max, :is_myself], unique: true
  end
end
