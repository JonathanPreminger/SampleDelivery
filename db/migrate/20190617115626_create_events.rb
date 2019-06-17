class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :revenue_figure
      t.integer :total_charge_dj
      t.integer :charge_communication
      t.integer :charge_others
      t.text :charge_others_description
      t.integer :number_of_dj
      t.text :line_up
      t.string :place
      t.string :name

      t.timestamps
    end
  end
end
