class Event < ApplicationRecord
  include ::ComptabilityConcern
  require 'csv'
validates :name, presence: true
validates :revenue_figure, presence: true, allow_nil: true

def headers
  {
    :subject => "Contact Form Test encore",
    :to => "jonathan.mete@hotmail.fr",
    :from => %("michou")
  }
end

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Event.create! row.to_hash
  end
end

def start_time
    self.start
  end
end
