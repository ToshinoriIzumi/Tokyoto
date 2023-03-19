class AddMinAndMaxToIncomes < ActiveRecord::Migration[6.0]
  def change
    add_column :incomes, :min, :integer, null: false
    add_column :incomes, :max, :integer, null: false
  end
end
