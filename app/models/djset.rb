class Djset < ApplicationRecord
  belongs_to :artist, :inverse_of => :djsets
  validates_presence_of :artist
  validates :club, :start, presence: true
  has_one :djsetvalidate

  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "jonathan.mete101514@gmail.com",
      :from => %("#{club}" <#{start.to_s}>)
    }
  end
end
