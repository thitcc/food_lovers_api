class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy evaluate_food]

  def index
    @user = User.all
    render json: @user, status: :ok
  end

  def show
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  def update
    @user.update!(user_params)
    head :no_content
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  def evaluate_food
    @food = Food.find(params[:food_id])

    @rating = Rating.create!(score: params[:score], user: @user, food: @food) if @food

    render json: @rating, status: :created
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
