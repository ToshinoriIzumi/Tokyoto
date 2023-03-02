class CreateAddinfoConditionsSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :addinfo_conditions_supports do |t|
      t.string :info_content, null: false

      t.timestamps
    end
  end
end
