class CreateConditionsSupportsStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_statuses do |t|
      t.references :condition, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
