class CreateFamilySituations < ActiveRecord::Migration[6.0]
  def change
    create_table :family_situations do |t|
      t.string :situation, null: false
      t.timestamps
    end
  end
end
