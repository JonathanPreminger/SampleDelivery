class AddNameToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :name, :text
  end
end
