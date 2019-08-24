class Event < ApplicationRecord
  require 'csv'



    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Event.create! row.to_hash
      end
    end
    def self.get_benefits
      get_benefits =  "la moula"
    end
    def start_time
      self.start
    end
end
