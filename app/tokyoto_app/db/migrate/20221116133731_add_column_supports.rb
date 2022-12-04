class AddColumnSupports < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :state, :integer, :null => false
  end
end
