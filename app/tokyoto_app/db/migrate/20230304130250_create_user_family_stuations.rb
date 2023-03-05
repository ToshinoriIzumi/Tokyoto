class CreateUserFamilyStuations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_family_stuations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :family_stuation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
