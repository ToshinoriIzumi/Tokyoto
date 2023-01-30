class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :support_name, null: false, index: {unique: true}
      t.text :content, null: false
      t.text :application_method
      t.string :application_limit
      t.string :update_method
      t.string :update_month

      t.timestamps
    end
  end
end
