class CreateUserFamilySituations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_family_situations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :family_situation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
