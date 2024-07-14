# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
  end

  def create
    @meals = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
    @total_calories = @meals.sum(:calories)
  end
end
