class AddNameToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :name, :text
  end
end
