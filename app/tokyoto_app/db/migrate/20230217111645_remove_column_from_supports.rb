class RemoveColumnFromSupports < ActiveRecord::Migration[6.0]
  def change
    remove_column :supports, :user_application_method, :string
    remove_column :supports, :user_application_limit, :string
    remove_column :supports, :user_renewal_method, :string
    remove_column :supports, :user_renewal_month, :string
  end
end
