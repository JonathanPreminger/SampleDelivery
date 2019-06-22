class RemoveNewFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :new, :string
  end
end
