class AddIndexToConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    add_index :conditions_supports, [:condition_id, :support_id], unique: true
  end
end
