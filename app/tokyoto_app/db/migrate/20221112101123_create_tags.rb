class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.string :color

      t.timestamps
    end
  end
end
