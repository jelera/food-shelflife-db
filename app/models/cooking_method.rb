class CookingMethod < ApplicationRecord
  belongs_to :ingredient

  def measure_range
    output = nil

    if self.size_metric
      output = {
        from: float_custom_format(self.measure_from),
        to: float_custom_format(self.measure_to),
        metric: self.size_metric,
        message: "from #{float_custom_format(self.measure_from)} to #{float_custom_format(self.measure_to)} #{self.size_metric}"
      }
    end

    output
  end

  def timing
    output = nil

    if self.timing_metric
      message = "from #{float_custom_format(self.timing_from)} to #{float_custom_format(self.timing_to)} #{self.timing_metric}"

      if self.timing_per
        message = "#{message}/#{self.timing_per}"
      end

        output = {
          from: float_custom_format(self.timing_from),
          to: float_custom_format(self.timing_to),
          metric: self.timing_metric,
          per: self.timing_per,
          message:  message
        }
    end

    output
  end

end
