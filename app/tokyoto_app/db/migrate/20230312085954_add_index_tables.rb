class AddIndexTables < ActiveRecord::Migration[6.0]
  def change
    add_index :conditions_supports_incomes, [:conditions_support_id, :income_id], unique: true, name: "income_conditions_support_unique"
    add_index :conditions_supports_statuses, [:condition_id, :status_id], unique: true, name: "status_conditions_support_unique"
    add_index :conditions_supports_applications_methods, [:application_method_id, :conditions_support_id], unique: true, name: "application_method_conditions_support_unique"
    add_index :conditions_supports_applications_forms, [:application_form_id, :conditions_support_id], unique: true, name: "application_form_conditions_support_unique"
    add_index :conditions_supports_addinfo_conditions_supports, [:addinfo_conditions_support_id, :conditions_support_id], unique: true, name: "addinfo_conditions_support_conditions_support_unique"
    add_index :conditions_supports_addinfo_applications, [:addinfo_application_id, :conditions_support_id], unique: true, name: "addinfo_applicant_conditions_support_unique"
    add_index :supports_tags, [:support_id, :tag_id], unique: true

  end
end
