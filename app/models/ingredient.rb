class Ingredient < ApplicationRecord
  has_many :cooking_methods
  has_one :cooking_tip
  belongs_to :category


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


  def hashify_data(min, max, metric)
    output = nil
    metric_list = %w(minutes hours days weeks months years)

    if metric
      if metric_list.include? metric.downcase

        if min == max
          message = "#{float_custom_format(min)} #{metric}"
        else
          message = "from #{float_custom_format(min)} to #{float_custom_format(max)} #{metric}"
        end

        output = {
          min: min,
          max: max,
          metric: metric,
          message: message
        }
      else
        output = {metric: metric}
      end
    end

    output
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

  def cooking_method
    output = nil
    if !self.cooking_methods.empty?
      output = self.cooking_methods.to_a.group_by { |method| method.method   }.transform_values {|value| {timing: value[0].timing, measure: value[0].measure_range} }
    end
    output
  end

  def shelf_life
    {
      pantry: hashify_data(self.pantry_min, self.pantry_max, self.pantry_metric),
      dop_pantry: hashify_data(self.dop_pantry_min, self.dop_pantry_max, self.dop_pantry_metric),
      pantry_after_openig: hashify_data(self.pantry_after_opening_min, self.pantry_after_opening_max, self.pantry_after_opening_metric),
      refrigerate: hashify_data(self.refrigerate_min, self.refrigerate_max, self.refrigerate_metric),
      dop_refrigerate: hashify_data(self.dop_refrigerate_min, self.dop_refrigerate_max, self.dop_refrigerate_metric),
      refrigerate_after_opening: hashify_data(self.refrigerate_after_opening_min, self.refrigerate_after_opening_max, self.refrigerate_after_opening_metric),
      refrigerate_after_thawing: hashify_data(self.refrigerate_after_thawing_min, self.refrigerate_after_thawing_max, self.refrigerate_after_thawing_metric),
      freeze: hashify_data(self.freeze_min, self.freeze_max, self.freeze_metric),
      dop_freeze: hashify_data(self.dop_freeze_min, self.dop_freeze_max, self.dop_freeze_metric),
      safe_to_refrigerate: self.safe_to_refrigerate?,
      safe_to_freeze: safe_to_freeze?
    }.select do |k,v| v end
  end

  def tips
    output = nil
    cooking_tip = self.cooking_tip
    if cooking_tip
      output = {
      storage: self.storage_tips,
      cooking: {
        recommendation: cooking_tip.tips,
        min_temp: cooking_tip.safe_mininum_temperature,
        resting_time: cooking_tip.resting_time
      }
    }

    end
    output
  end

  def total_info
    category = self.category

    {
      id: self.id,
      name: self.name,
      subtitle_name: self.name_subtitle ? self.name_subtitle : "",
      category:  {
        id: self.category.id,
        name: self.category.name,
        subcategory: self.category.subcategory_name ? self.category.subcategory_name : ""
      },
      keywords: self.keywords,
      shelf_life: self.shelf_life,
      cooking_methods: self.cooking_method,
      tips: self.tips
    }
  end

end
