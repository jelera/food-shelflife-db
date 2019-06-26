class Ingredient < ApplicationRecord
  has_one :cooking_method
  has_one :cooking_tip
  belongs_to :category
end
