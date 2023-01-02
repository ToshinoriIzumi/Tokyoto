class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string, index: {unique: true}
    add_column :users, :city_id, :integer
    add_column :users, :income, :integer
  end
end
