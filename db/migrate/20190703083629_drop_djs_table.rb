class DropDjsTable < ActiveRecord::Migration[5.2]
  def up
     drop_table :djs
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
