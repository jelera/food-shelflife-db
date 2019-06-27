class Ingredient < ApplicationRecord
  has_one :cooking_method
  has_one :cooking_tip
  belongs_to :category

  def pantry
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.pantry_metric
      if metric_time_list.include? self.pantry_metric.downcase
        output = "from #{self.pantry_min} to #{self.pantry_max} #{self.pantry_metric}"
      else
        output = self.pantry_metric
      end
    end

    output
  end

  def dop_pantry
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.dop_pantry_metric
      if metric_time_list.include? self.pantry_metric.downcase
        output = "from #{self.dop_pantry_min} to #{self.dop_pantry_max} #{self.dop_pantry_metric}"
      else
        output = self.dop_pantry_metric
      end
    end

    output
  end

  def pantry_after_opening
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.pantry_after_opening_metric
      if metric_time_list.include? self.pantry_after_opening_metric.downcase
        output = "from #{self.pantry_after_opening_min} to #{self.pantry_after_opening_max} #{self.pantry_after_opening_metric}"
      else
        output = self.pantry_after_opening_metric
      end
    end

    output
  end

  def safe_to_refrigerate?
    output = nil
    if self.refrigerate_metric
      if self.refrigerate_metric.downcase == "not recommended"
        output = false
      else
        output = true
      end
    end
    output
  end

  def refrigerate
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.refrigerate_metric
      if metric_time_list.include? self.refrigerate_metric.downcase
        output = "from #{self.refrigerate_min} to #{self.pantry_max} #{self.pantry_metric}"
      else
        output = self.refrigerate_metric
      end
    end

    output
  end

  def dop_refrigerate
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.dop_refrigerate_metric
      if metric_time_list.include? self.dop_refrigerate_metric.downcase
        output = "from #{self.dop_refrigerate_min} to #{self.dop_refrigerate_max} #{self.dop_refrigerate_metric}"
      else
        output = self.dop_refrigerate_metric
      end
    end

    output
  end

  def refrigerate_after_opening
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.refrigerate_after_opening_metric
      if metric_time_list.include? self.refrigerate_after_opening_metric.downcase
        output = "from #{self.refrigerate_after_opening_min} to #{self.refrigerate_after_opening_max} #{self.refrigerate_after_opening_metric}"
      else
        output = self.refrigerate_after_opening_metric
      end
    end

    output
  end

  def refrigerate_after_thawing
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.refrigerate_after_thawing_metric
      if metric_time_list.include? self.refrigerate_after_thawing_metric.downcase
        output = "from #{self.refrigerate_after_thawing_min} to #{self.refrigerate_after_thawing_max} #{self.refrigerate_after_thawing_metric}"
      else
        output = self.refrigerate_after_thawing_metric
      end
    end

    output
  end

  def safe_to_freeze?
    output = nil
    if self.freeze_metric
      if self.freeze_metric.downcase == "not recommended"
        output = false
      else
        output = true
      end
    end
    output
  end

  def freeze
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.freeze_metric
      if metric_time_list.include? self.freeze_metric.downcase
        output = "from #{self.freeze_min} to #{self.freeze_max} #{self.freeze_metric}"
      else
        output = self.freeze_metric
      end
    end

    output
  end

  def dop_freeze
    output = nil
    metric_time_list = %w(minutes hours days weeks months years)

    if self.dop_freeze_metric
      if metric_time_list.include? self.dop_freeze_metric.downcase
        output = "from #{self.dop_freeze_min} to #{self.dop_freeze_max} #{self.dop_freeze_metric}"
      else
        output = self.dop_freeze_metric
      end
    end

    output
  end

  def shelf_life
    {
      pantry: self.pantry,
      dop_pantry: self.dop_pantry,
      pantry_after_opening: self.pantry_after_opening,
      safe_to_refrigerate: self.safe_to_refrigerate?,
      refrigerate: self.refrigerate,
      dop_refrigerate: self.dop_refrigerate,
      refrigerate_after_opening: self.refrigerate_after_opening,
      refrigerate_after_thawing: self.refrigerate_after_thawing,
      safe_to_freeze: self.safe_to_freeze?,
      freeze: self.freeze,
      dop_freeze: self.dop_freeze
    }.select do |k,v| v end
  end

  def storage_tips
    tips = {
      pantry: self.pantry_tips,
      dop_pantry: self.dop_pantry_tips,
      refrigerate: self.refrigerate_tips,
      dop_refrigerate: self.dop_refrigerate_tips,
      freeze: self.freeze_tips,
      dop_freeze: self.dop_freeze_tips
    }.select do |k,v| v end

    tips.empty? ? nil : tips
  end

end
