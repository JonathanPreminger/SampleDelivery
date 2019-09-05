class Event < ApplicationRecord
  require 'csv'
validates :name, presence: true

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Event.create! row.to_hash
      end
    end
    def self.get_benefits
    end
    def start_time
      self.start
    end
end
