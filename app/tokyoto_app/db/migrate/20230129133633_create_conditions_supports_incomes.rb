class CreateConditionsSupportsIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_incomes do |t|
      t.references :conditions_support, null: false, foreign_key: true
      t.references :income, null: false, foreign_key: true

      t.timestamps
    end
  end
end
