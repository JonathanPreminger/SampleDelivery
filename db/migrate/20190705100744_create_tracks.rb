class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.text :name
      t.text :duration

      t.timestamps
    end
  end
end
