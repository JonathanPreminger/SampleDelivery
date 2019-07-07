class Realrelease < ApplicationRecord
  belongs_to :artist
  has_many :tracks, inverse_of: :realrelease
  accepts_nested_attributes_for :tracks

end
