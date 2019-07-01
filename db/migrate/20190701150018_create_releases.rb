class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.text :name
      t.text :year
      t.text :tracks

      t.timestamps
    end
  end
end
