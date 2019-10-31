module ComptabilityConcern
  extend ActiveSupport::Concern

  class_methods do

    # the total benefits
    def total_benefits
      Event.sum(:revenue_figure) - Event.total_charge
    end

    # the total charge
    def total_charge
      Event.sum(:total_charge_dj) + Event.sum(:charge_others) + Event.sum(:charge_communication)
    end

    # the average benefits
    def average_benefits
      Event.total_benefits / Event.count
    end
  end

  # the benefits for an event
  def benefits
      revenue_figure.to_i - total_charge_dj.to_i - charge_others.to_i - charge_communication.to_i
  end

  # the benefits compare to the total average benefits
  def benefits_rate
   result = (100 * (benefits / Event.average_benefits.to_f)) - 100
   result.round(1)
  end

  # the positivness of the benefits rate
  def positiv_benefits_rate
    benefits_rate >= 0
  end

  # total_charge
  def total_charge_indiv
    total_charge_dj + charge_others + charge_communication
  end

  # ROI
  def return_rate
    ((benefits.to_f / revenue_figure.to_f) * 100).round
  end

  # the positivness of the return rate
  def positiv_return_rate
     return_rate > 0
  end
end
