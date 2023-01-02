class RemoveUnique < ActiveRecord::Migration[6.0]
  def change
    remove_index :ages, :max
    remove_index :ages, :min
    remove_index :incomes, :money
  end
end
