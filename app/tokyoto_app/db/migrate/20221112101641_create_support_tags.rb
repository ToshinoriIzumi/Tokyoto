class CreateSupportTags < ActiveRecord::Migration[6.0]
  def change
    create_table :support_tags do |t|
      t.references :support, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
