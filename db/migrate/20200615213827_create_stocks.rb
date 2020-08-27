class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.float :quantity
      t.float :price
      t.references :realrelease, foreign_key: true

      t.timestamps
    end
  end
end
