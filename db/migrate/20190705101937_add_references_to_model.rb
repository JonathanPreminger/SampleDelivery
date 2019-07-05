class AddReferencesToModel < ActiveRecord::Migration[5.2]
  def change
    add_reference :realreleases, :artist, index: true
  end
end
