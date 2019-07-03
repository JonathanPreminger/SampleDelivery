class DropReleasesTable < ActiveRecord::Migration[5.2]
  def up
     drop_table :releases
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
