class Dj < ApplicationRecord
  has_many :releases
  has_many :events
end
