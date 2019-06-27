class CookingMethod < ApplicationRecord
  belongs_to :ingredient

  def measure_range
    # from 3.0 to 4.0 pounds
    "from #{self.measure_from} to #{self.measure_to} #{self.size_metric}"
  end

  def timing
    output = "from #{self.timing_from} to #{self.timing_to} #{self.timing_metric}"

    if self.timing_per
      output = "#{output} per #{self.timing_per}"
    end

    output
  end

end
