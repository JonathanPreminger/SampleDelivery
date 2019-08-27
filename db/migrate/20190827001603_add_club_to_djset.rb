class AddClubToDjset < ActiveRecord::Migration[5.2]
  def change
    add_column :djsets, :club, :text
  end
end
