class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.integer :role, null: false, default: 0
      t.string :user_name, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
