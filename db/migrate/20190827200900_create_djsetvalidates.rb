class CreateDjsetvalidates < ActiveRecord::Migration[5.2]
  def change
    create_table :djsetvalidates do |t|
      t.boolean :valid
      t.references :djset, foreign_key: true
      t.timestamps
    end
  end
end
