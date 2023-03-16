class CreateAddinfoApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :addinfo_applications do |t|
      t.string :info_content, null: false

      t.timestamps
    end
  end
end
