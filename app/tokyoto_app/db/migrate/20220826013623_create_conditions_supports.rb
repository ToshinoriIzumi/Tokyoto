class CreateConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports, id: false do |t|
      t.bigserial :condition_id, limit: 8, null: false
      t.references :support, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.integer :dependents_num, null: false
      t.references :income, null: false, foreign_key: true
      t.references :age, null: false, foreign_key: true

      t.timestamps
    end

    sql = 'ALTER TABLE conditions_supports ADD PRIMARY KEY (condition_id, support_id);'
    ActiveRecord::Base.connection.execute(sql)
  end
end
