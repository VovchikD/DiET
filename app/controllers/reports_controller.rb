# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
  end

  def create
    @meals = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
  end

  def enable_weekly
    current_user.report_configuration.update(weekly_reports: true)
    WeeklyReportJob.perform_later(current_user.id)
    redirect_to meals_path
  end

  def enable_monthly
    current_user.report_configuration.update(monthly_reports: true)
    MonthlyReportJob.perform_later(current_user.id)
    redirect_to meals_path
  end

  def enable_daily
    current_user.report_configuration.update(daily_reports: true)
    DailyReportJob.perform_later(current_user.id)
    redirect_to meals_path
  end

  def report_attributes; end
end
