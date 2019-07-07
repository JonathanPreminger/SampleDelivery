class Artist < ApplicationRecord
  has_many :realreleases
  has_many :tracks, through: :realrelease
  accepts_nested_attributes_for :realreleases
end
