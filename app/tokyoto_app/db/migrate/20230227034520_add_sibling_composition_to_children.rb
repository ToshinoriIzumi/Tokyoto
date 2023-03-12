class AddSiblingCompositionToChildren < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :sibling_composition, :integer, null: false, default: 0
  end
end
