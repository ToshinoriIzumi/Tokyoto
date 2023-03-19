class AddStateToSupports < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :publish_state, :integer, :null => false, :default => 0
  end
end
