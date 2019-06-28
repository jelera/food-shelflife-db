class CookingTip < ApplicationRecord
  belongs_to :ingredient

  def resting_time
    self.rest_time_metric ?  "#{self.rest_time} #{self.rest_time_metric}" : nil
  end
end
