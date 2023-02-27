class CreateUserStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :is_status, null: false

      t.timestamps
    end
  end
end
