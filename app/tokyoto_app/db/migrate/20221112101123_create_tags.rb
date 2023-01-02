class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :color, null:false, index: {unique: true}

      t.timestamps
    end
  end
end
