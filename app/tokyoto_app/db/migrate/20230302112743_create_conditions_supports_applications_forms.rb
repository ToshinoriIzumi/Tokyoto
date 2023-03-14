class CreateConditionsSupportsApplicationsForms < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_applications_forms do |t|
      t.references :application_form, null: false, foreign_key: true, index: {name: "applications_form_CN_intermediate_table"}
      t.references :conditions_support, null: false, foreign_key: true, index: {name: "conditions_supports_AF_intermediate_table"}

      t.timestamps
    end
  end
end
