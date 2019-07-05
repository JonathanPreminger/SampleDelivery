class AddReferencesToRealrelease < ActiveRecord::Migration[5.2]
  def change
      add_reference :tracks, :realrelease, index: true
  end
end
