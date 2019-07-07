class Track < ApplicationRecord
  belongs_to :realrelease, inverse_of: :tracks
  validates_presence_of :realrelease
end
