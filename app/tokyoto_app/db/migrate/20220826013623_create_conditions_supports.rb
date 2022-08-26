class CreateConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports do |t|
      t.references :support, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :income, null: false, foreign_key: true
      t.references :age, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.references :benefit, null: false, foreign_key: true

      t.timestamps
    end

    add_index :conditions_supports, [:support_id, :city_id, :income_id, :age_id, :status_id, :benefit_id], name: 'condition_combination',  unique: true
  end
end
