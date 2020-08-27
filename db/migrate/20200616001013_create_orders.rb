class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :realrelease, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
