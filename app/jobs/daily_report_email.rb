# frozen_string_literal: true

class DailyReportJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return user

    start_date = Time.zone.today.beginning_of_day
    end_date = Time.zone.today.end_of_day
    meals = user.meals.where(eaten_at: start_date..end_date)
    total_calories = meals.sum(:calories)

    ReportMailer.daily_report_email(user, start_date, end_date, total_calories).deliver_later
  end
end