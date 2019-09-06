class Event < ApplicationRecord
  require 'csv'
validates :name, presence: true

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Event.create! row.to_hash
      end
    end

    def benefits
      revenue_figure - total_charge_dj - charge_others - charge_communication
    end

    def benefits_rate
   result = 100 * ((benefits / Event.average_benefits) - 1)
   result.to_i
    end

    def positiv
       benefits_rate > 0
    end

    def self.total_benefits
      Event.sum(:revenue_figure) - Event.sum(:total_charge_dj) - Event.sum(:charge_others) - Event.sum(:charge_communication)
    end

    def self.average_benefits
      Event.total_benefits.to_f / Event.count
    end

    def start_time
      self.start
    end
end
