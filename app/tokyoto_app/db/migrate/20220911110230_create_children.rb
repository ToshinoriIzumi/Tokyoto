class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age

      t.timestamps
    end
  end
end
