# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
  end

  def create
    @meals = current_user.meals.where(eaten_at: params[:start_date]..params[:end_date])
  end

  def enable
    current_user.report_configuration || current_user.create_report_configuration

    case params[:type]
    when 'weekly'
      current_user.report_configuration.update(weekly_reports: true)
      WeeklyReportJob.perform_later(current_user.id)
    when 'monthly'
      current_user.report_configuration.update(monthly_reports: true)
      MonthlyReportJob.perform_later(current_user.id)
    when 'daily'
      current_user.report_configuration.update(daily_reports: true)
      DailyReportJob.perform_later(current_user.id)
    else
      flash.now[:alert] = 'Invalid report type'
    end
    redirect_to meals_path
  end

  def report_attributes; end
end
