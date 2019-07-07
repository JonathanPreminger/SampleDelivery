class RemoveTrackFromRealrelease < ActiveRecord::Migration[5.2]
  def change
    remove_column :realreleases, :tracks, :text
  end
end
