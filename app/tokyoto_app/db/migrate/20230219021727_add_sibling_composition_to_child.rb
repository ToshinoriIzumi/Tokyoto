class AddSiblingCompositionToChild < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :sibling_conposition, :integer, default: 0
  end
end
