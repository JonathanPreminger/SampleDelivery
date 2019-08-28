class Djset < ApplicationRecord
  belongs_to :artist, :inverse_of => :djsets
  validates_presence_of :artist
  validates :club, :start, presence: true
  has_one :djsetvalidate
end
