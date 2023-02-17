class AddColumnToConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    add_column :conditions_supports, :user_application_method, :string
    add_column :conditions_supports, :user_application_limit, :string
    add_column :conditions_supports, :user_renewal_method, :string
    add_column :conditions_supports, :user_renewal_month, :string
  end
end
