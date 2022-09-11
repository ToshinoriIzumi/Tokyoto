class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :income, :integer
    add_column :users, :child_num, :integer
  end
end
