class CreateConditionsSupportsAddinfoConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_addinfo_conditions_supports do |t|
      t.references :addinfo_conditions_support, null: false, foreign_key: true, index: {name: "addinfo_conditions_support_CN_intermediate_table"}
      t.references :conditions_support, null: false, foreign_key: true, index: {name: "conditions_supports_ACS_intermediate_table"}

      t.timestamps
    end
  end
end
