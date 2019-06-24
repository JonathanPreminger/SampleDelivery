class Event < ApplicationRecord
  require 'csv'
  validates :line_up,  presence: true
  validates :charge_others_description,  presence: true
  validates :charge_others,  presence: true
  validates :total_charge_dj,  presence: true
  validates :charge_communication,  presence: true
  validates :revenue_figure, presence: true
  validates :place, presence: true
  validates :name, presence: true


    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Event.create! row.to_hash
      end
    end
    def self.get_benefits
      get_benefits =  "la moula"
    end
end
