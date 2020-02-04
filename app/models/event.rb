class Event < ApplicationRecord
  include ::ComptabilityConcern
  require 'csv'
  scope :last_event, -> { where(id:Event.last.id) }
  validates :name, presence: true
  validates :charge_communication, presence: true
  validates :charge_others, presence: true
  validates :total_charge_dj, presence: true
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
