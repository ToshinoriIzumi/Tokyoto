class CreateApplicationForms < ActiveRecord::Migration[6.0]
  def change
    create_table :application_forms do |t|
      t.string :application_form_name, null: false
      t.string :application_form_url

      t.timestamps
    end
  end
end
