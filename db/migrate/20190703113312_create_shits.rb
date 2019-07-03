class CreateShits < ActiveRecord::Migration[5.2]
  def change
    create_table :shits do |t|
      t.text :name

      t.timestamps
    end
  end
end
