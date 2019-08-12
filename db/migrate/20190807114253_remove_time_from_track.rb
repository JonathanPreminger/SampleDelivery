class RemoveTimeFromTrack < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :time, :string
  end
end
