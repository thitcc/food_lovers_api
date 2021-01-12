class RatingsController < ApplicationController
  before_action :set_rating, only: %i[show update destroy]

  def index
    @rating = Rating.all
    render json: @rating, status: :ok
  end

  def show
    render json: @rating
  end

  def create
    @rating = Rating.create!(rating_params)
    render json: @rating, status: :created
  end

  def update
    @rating.update!(rating_params)
    head :no_content
  end

  def destroy
    @rating.destroy!
    head :no_content
  end

  private

  def rating_params
    params.permit(:score, :user_id, :food_id)
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
