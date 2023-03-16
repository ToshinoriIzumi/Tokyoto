class CreateConditionsSupportsApplicationsMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_applications_methods do |t|
      t.references :application_method, null: false, foreign_key: true, index: {name: "applications_method_CN_intermediate_table"}
      t.references :conditions_support, null: false, foreign_key: true, index: {name: "conditions_supports_AP_intermediate_table"}

      t.timestamps
    end
  end
end
