class CreateDjs < ActiveRecord::Migration[5.2]
  def change
    create_table :djs do |t|
      t.text :name
      t.references :release, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
