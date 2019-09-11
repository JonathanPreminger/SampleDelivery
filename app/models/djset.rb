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


    def count_djset_without_response
      @djsets = Djset.all.order('created_at DESC')
      @pending_dj_set = @djsets.select { |djset| djset.confirmdjset == nil }
      @djset_request_pending = @pending_dj_set.count
    end

    def self.request_equal_zero
      @djset_request_pending == 0
    end

end
