class DropDjsetvalidate < ActiveRecord::Migration[5.2]
  def change
    drop_table :djsetvalidates
  end
end
