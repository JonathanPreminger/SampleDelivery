class Artist < ApplicationRecord
  has_many :realreleases, dependent: :destroy, inverse_of: :artist
  has_many :tracks, through: :realreleases
  accepts_nested_attributes_for :realreleases,  reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end
