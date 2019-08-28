class AddValidToDjset < ActiveRecord::Migration[5.2]
  def change
    add_column :djsets, :valid, :boolean
  end
end
