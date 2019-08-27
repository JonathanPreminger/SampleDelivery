class Artist < ApplicationRecord
  has_many :realreleases
  has_many :djsets
  has_many :tracks, through: :realrelease  
  accepts_nested_attributes_for :realreleases
  accepts_nested_attributes_for :djsets
  has_one_attached :image
end
