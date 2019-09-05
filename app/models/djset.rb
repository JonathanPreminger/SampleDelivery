class Djset < ApplicationRecord
  belongs_to :artist, :inverse_of => :djsets
  validates_presence_of :artist
  validates :club, :start, presence: true

  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "jonathan.mete@hotmail.fr",
      :from => %("#{club}" <#{start.to_s}>)
    }
  end
end
