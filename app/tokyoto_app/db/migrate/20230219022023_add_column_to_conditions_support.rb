class AddColumnToConditionsSupport < ActiveRecord::Migration[6.0]
  def change
    add_column :conditions_supports, :additional_info_of_application, :string
    add_column :conditions_supports, :application_form, :string
    add_column :conditions_supports, :additional_info_conditions_supports, :string
  end
end
