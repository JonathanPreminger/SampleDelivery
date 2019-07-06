class Realrelease < ApplicationRecord
  belongs_to :artist,:foreign_key => "creator_id", inverse_of: :realreleases
  has_many :tracks
end
