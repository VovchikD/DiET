# frozen_string_literal: true

class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update show destroy]

  def index
    @meals = Meal.all
  end

  def show; end

  def new
    @meal = Meal.new
  end

  def edit; end

  def create
    @meal = build_meal_from_params

    if save_meal_with_calories
      redirect_to @meal, notice: 'Meal was successfully created.'
    else
      handle_failed_creation
    end
  end

  def update
    authorize @meal
    @meal.calories = CalorieService.get_calories(meal_params[:name]) if meal_params[:name]

    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @meal
    @meal.destroy
    redirect_to meals_path, notice: 'Meal was successfully destroyed.'
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :calories, :eaten_at)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def build_meal_from_params
    current_user.meals.build(meal_params)
  end

  def save_meal_with_calories
    @meal.calories = CalorieService.get_calories(@meal.name)
    authorize @meal

    @meal.calories.present? && @meal.save
  end

  def handle_failed_creation
    logger.info "Meal could not be created: #{@meal.errors.full_messages}"
    flash.now[:notice] = 'Meal was not good.'
    render :new
  end
end
