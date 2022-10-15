class RemoveTagFromSupports < ActiveRecord::Migration[6.0]
  def change
    remove_column :supports, :tag, :string
  end
end
