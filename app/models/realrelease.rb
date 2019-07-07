class Realrelease < ApplicationRecord
  belongs_to :artist,:foreign_key => "artist_id", inverse_of: :realreleases
  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: proc { |attributes| attributes[:name].blank? },allow_destroy: true
end
