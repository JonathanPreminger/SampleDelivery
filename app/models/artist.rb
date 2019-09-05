class Artist < ApplicationRecord
  has_many :realreleases, dependent: :destroy
  has_many :djsets, :inverse_of => :artist, dependent: :destroy
  has_many :tracks, through: :realreleases, dependent: :destroy
  accepts_nested_attributes_for :realreleases
  accepts_nested_attributes_for :djsets
  has_one_attached :image
  validates :name, presence: true
end
