class RemoveValidFromDjset < ActiveRecord::Migration[5.2]
  def change
    remove_column :djsets, :valid, :boolean
  end
end
