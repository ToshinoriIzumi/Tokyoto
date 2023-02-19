class AddContactInformationSupports < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :contact_information, :string
  end
end
