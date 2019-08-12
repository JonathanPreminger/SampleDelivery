class AddTimeToTrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :time, :string
  end
end
