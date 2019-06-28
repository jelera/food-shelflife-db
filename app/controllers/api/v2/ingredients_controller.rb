class Api::V2::IngredientsController < ApplicationController

  def index
    ingredients = Ingredient.all.map {| ingredient | ingredient.total_info }
    render json: ingredients
  end

  def show
    begin
      ingredient = Ingredient.find(params[:id]).total_info
    rescue
      render json: {errors: "ingredient not found", status: :unprocessable_entity}
    else
      render json: ingredient, status: :accepted
    end
  end

end
