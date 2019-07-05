class Realrelease < ApplicationRecord
  belongs_to :artist, inverse_of: :realreleases
  has_many :tracks
end
