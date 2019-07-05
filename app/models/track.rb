class Track < ApplicationRecord
  belongs_to :realrelease, dependent: :destroy
  belongs_to :artist, dependent: :destroy
end
