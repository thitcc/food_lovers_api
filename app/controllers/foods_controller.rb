# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :set_food, only: %i[show update destroy]

  def index
    @food = Food.all
    render json: @food, status: :ok
  end

  def show
    render json: @food
  end

  def create
    @food = Food.create!(food_params)
    render json: @food, status: :created
  end

  def update
    @food.update!(food_params)
    head :no_content
  end

  def destroy
    @food.destroy!
    head :no_content
  end

  private

  def food_params
    params.permit(:title, :description, :category_id, :user_id)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
