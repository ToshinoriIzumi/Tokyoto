class ChangeSupportTagsToSupportsTags < ActiveRecord::Migration[6.0]
  def change
    rename_table :support_tags, :supports_tags
  end
end
