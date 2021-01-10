# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def index
    categories = Category.all
    render json: categories, status: :ok
  end

  def show
    render json: @category
  end

  def create
    category = Category.create!(category_params)
    render json: category, status: :created
  end

  def update
    @category.update!(category_params)
    head :no_content
  end

  def destroy
    @category.destroy!
    head :no_content
  end

  private

  def category_params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
