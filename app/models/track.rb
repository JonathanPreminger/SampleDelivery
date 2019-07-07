class Track < ApplicationRecord
  belongs_to :realrelease,:foreign_key => "realrelease_id", inverse_of: :tracks
  belongs_to :artist, dependent: :destroy
end
