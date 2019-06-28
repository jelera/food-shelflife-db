class Api::V2::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: categories
  end

  def show
    begin
      category = Category.find(params[:id])
    rescue
      render json: {status: :unprocessible_entity, errors: "category not found"}
    else
      render json: category, status: :accepted
    end
  end

end
