class RemoveColorFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :color, :string
  end
end
