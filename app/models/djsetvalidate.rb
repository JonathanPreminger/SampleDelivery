class Djsetvalidate < ApplicationRecord
  belongs_to :djset, :inverse_of => :djsetvalidate
  validates_presence_of :djset
end
