class DropShitsTable < ActiveRecord::Migration[5.2]
  def up
     drop_table :shits
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
