class CreateFamilyStuations < ActiveRecord::Migration[6.0]
  def change
    create_table :family_stuations do |t|
      t.string :stuation, null: false
      t.timestamps
    end
  end
end
