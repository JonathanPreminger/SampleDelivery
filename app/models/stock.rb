class Stock < ApplicationRecord
  belongs_to :realrelease
  validates_presence_of :realrelease
end
