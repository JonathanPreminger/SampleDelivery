class AddNumberToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :number, :string
  end
end
