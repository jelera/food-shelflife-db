class Api::V1::IngredientsController < ApplicationController

  def index
    ingredients = Ingredient.all
    render json: ingredients
  end

  def show
    begin
      ingredient = Ingredient.find(params[:id])
    rescue
      render json: {errors: "ingredient not found", status: :unprocessable_entity}
    else
      render json: ingredient, status: :accepted
    end
  end

end
