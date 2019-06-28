require 'csv'

def categories
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))

  csv = CSV.parse(csv_text, headers: true)

  csv.each do |row|
    Category.create(
      name: row[0],
      subcategory_name: row[1]
    )
  end
end

def ingredients
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'ingredients.csv'))

  csv = CSV.parse(csv_text, headers: true)

  csv.each do |row|
    Ingredient.create(
      category_id: row[0],
      name: row[1],
      name_subtitle: row[2],
      keywords: row[3],
      pantry_min: row[4],
      pantry_max: row[5],
      pantry_metric: row[6],
      pantry_tips: row[7],
      dop_pantry_min: row[8],
      dop_pantry_max: row[9],
      dop_pantry_metric: row[10],
      dop_pantry_tips: row[11],
      pantry_after_opening_min: row[12],
      pantry_after_opening_max: row[13],
      pantry_after_opening_metric: row[14],
      refrigerate_min: row[15],
      refrigerate_max: row[16],
      refrigerate_metric: row[17],
      refrigerate_tips: row[18],
      dop_refrigerate_min: row[19],
      dop_refrigerate_max: row[20],
      dop_refrigerate_metric: row[21],
      dop_refrigerate_tips: row[22],
      refrigerate_after_opening_min: row[23],
      refrigerate_after_opening_max: row[24],
      refrigerate_after_opening_metric: row[25],
      refrigerate_after_thawing_max: row[26],
      refrigerate_after_thawing_min: row[27],
      refrigerate_after_thawing_metric: row[28],
      freeze_min: row[29],
      freeze_max: row[30],
      freeze_metric: row[31],
      freeze_tips: row[32],
      dop_freeze_min: row[33],
      dop_freeze_max: row[34],
      dop_freezer_metric: row[35],
      dop_freezer_tips: row[36]
    )
  end
end

def cookingtips
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'cookingtips.csv'))

  csv = CSV.parse(csv_text, headers: true)

  csv.each do |row|
    CookingTip.create(
      ingredient_id: row[0],
      tips: row[1],
      safe_mininum_temperature: row[2],
      rest_time: row[3],
      rest_time_metric: row[4]
    )
  end
end

def cookingmethods
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'cookingmethods.csv'))

  csv = CSV.parse(csv_text, headers: true)

  csv.each do |row|
    CookingMethod.create(
      ingredient_id: row[0],
      cooking_method: row[1],
      measure_from: row[2],
      measure_to: row[3],
      size_metric: row[4],
      cookiing_temperature: row[5],
      timing_from: row[6],
      timing_to: row[7],
      timing_metric: row[8],
      timing_per: row[9]
    )
  end
end

# categories
# ingredients
cookingtips
cookingmethods

puts <<-OUTPUT

SEEDING DATABASE ...

Created #{Category.all.count} Categories
Created #{Ingredient.all.count} Ingredients
Created #{CookingMethod.all.count} Cooking Methods
Created #{CookingTip.all.count} Cooking Tips

OUTPUT

