class RemoveapplicationsColumnFromConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    remove_column :conditions_supports, :user_application_method, :string
    remove_column :conditions_supports, :additional_info_of_application, :string
    remove_column :conditions_supports, :application_form, :string
    remove_column :conditions_supports, :additional_info_conditions_supports, :string
  end
end
