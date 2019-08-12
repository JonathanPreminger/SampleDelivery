class Realrelease < ApplicationRecord
  belongs_to :artist
  has_many :tracks, inverse_of: :realrelease
  accepts_nested_attributes_for :tracks
  has_one_attached :image
end
