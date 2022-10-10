class AddTagToSupport < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :tag, :string
  end
end
