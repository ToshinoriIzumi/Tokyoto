class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :support_name, null: false, index: {unique: true}
      t.text :content, null: false
      t.text :user_application_method
      t.string :user_application_limit
      t.string :user_renewal_method
      t.string :user_renewal_month

      t.timestamps
    end
  end
end
