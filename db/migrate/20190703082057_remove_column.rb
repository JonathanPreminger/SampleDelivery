class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :djs, :event_id
    remove_column :djs, :release_id
  end
end
