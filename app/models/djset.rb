class Djset < ApplicationRecord
  belongs_to :artist, :inverse_of => :djsets
  validates_presence_of :artist
  validates :club, :start, :emailforrequest, presence: true

end
