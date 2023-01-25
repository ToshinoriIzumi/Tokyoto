class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|

      t.timestamps
    end
  end
end
