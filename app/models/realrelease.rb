class Realrelease < ApplicationRecord
  belongs_to :artist
  has_one :stock
  has_many :tracks, inverse_of: :realrelease, dependent: :destroy
  accepts_nested_attributes_for :tracks
  has_one_attached :image
  validates_presence_of :artist
  validates :name, presence: true
end
