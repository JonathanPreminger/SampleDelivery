class CreateRealreleases < ActiveRecord::Migration[5.2]
  def change
    create_table :realreleases do |t|
      t.text :name
      t.text :tracks
      t.text :year

      t.timestamps
    end
  end
end
