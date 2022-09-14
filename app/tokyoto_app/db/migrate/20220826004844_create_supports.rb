class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :support_name, null: false
      t.text :content, null: false
      t.text :application_method
      t.string :application_limit
      t.string :url, null: false

      t.timestamps
    end
  end
end
