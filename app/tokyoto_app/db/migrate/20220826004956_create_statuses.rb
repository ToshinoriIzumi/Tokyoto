class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
