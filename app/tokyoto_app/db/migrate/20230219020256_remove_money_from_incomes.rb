class RemoveMoneyFromIncomes < ActiveRecord::Migration[6.0]
  def change
    remove_column :incomes, :money, :integer
  end
end
