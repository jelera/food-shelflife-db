class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # This function will return a integer if the float has only zeroes after
  # the decimal point
  def float_custom_format(num)
    num == num.to_i ? num.to_i : num
  end

end
