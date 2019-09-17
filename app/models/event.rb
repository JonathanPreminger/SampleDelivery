class Event < ApplicationRecord
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

    # the benefits for an event
    def benefits
        revenue_figure.to_i - total_charge_dj.to_i - charge_others.to_i - charge_communication.to_i
    end

    # the benefits compare to the average benefits in percentage
    def benefits_rate
     result = 100 * ((benefits / Event.average_benefits) - 1)
     result.to_i
    end

    # the positivness of the benefits rate
    def positiv_benefits_rate
       benefits_rate > 0
    end

    # total_charge
    def self.total_charge
      Event.sum(:total_charge_dj) + Event.sum(:charge_others) + Event.sum(:charge_communication)
    end

    # the rate of return
    def return_rate
      (100 * benefits) / Event.total_charge
    end

    # the positivness of the return rate
    def positiv_return_rate
       return_rate > 0
    end

    # the total of the benefits of all the events
    def self.total_benefits
      Event.sum(:revenue_figure) - Event.total_charge
    end

    # the average benefits
    def self.average_benefits
      Event.total_benefits.to_f / Event.count
    end

    def start_time
      self.start
    end
end
