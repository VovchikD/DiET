class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  def index
    @diets = current_user.diets
  end

  def show
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = current_user.diets.build(diet_params)

    if @diet.save
      redirect_to @diet, notice: 'Diet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diet.update(diet_params)
      redirect_to @diet, notice: 'Diet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @diet.destroy
    redirect_to diets_url, notice: 'Diet was successfully destroyed.'
  end

  private

  def set_diet
    @diet = current_user.diets.find(params[:id])
  end

  def diet_params
    params.require(:diet).permit(:name, :calories, meal_ids: [])
  end
end