class CreateDjsets < ActiveRecord::Migration[5.2]
  def change
    create_table :djsets do |t|
      t.datetime :start
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
