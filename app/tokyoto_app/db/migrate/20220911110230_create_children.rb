class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.references :user, null: false, foreign_key: true
      t.date :birth, null: false

      t.timestamps
    end
  end
end
