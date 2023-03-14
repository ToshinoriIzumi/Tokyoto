class CreateConditionsSupportsAddinfoApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions_supports_addinfo_applications do |t|
      t.references :addinfo_application, null: false, foreign_key: true, index: {name: "addinfo_application_CN_intermediate_table"}
      t.references :conditions_support, null: false, foreign_key: true, index: {name: "conditions_supports_AA_intermediate_table"}

      t.timestamps
    end
  end
end
