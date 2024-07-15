# frozen_string_literal: true

class ReportMailer < ApplicationMailer
  layout 'mailer'

  def weekly_report_email(user, start_date, end_date, total_calories)
    @user = user
    @start_date = start_date
    @end_date = end_date
    @total_calories = total_calories

    mail(to: @user.email, subject: 'Your Weekly Report')
  end

  def monthly_report_email(user, start_date, end_date, total_calories)
    @user = user
    @start_date = start_date
    @end_date = end_date
    @total_calories = total_calories

    mail(to: @user.email, subject: 'Your Monthly Report')
  end

  def daily_report_email(user, start_day, end_day, total_calories)
    @user = user
    @start_date = start_date
    @end_date = end_date
    @total_calories = total_calories

    mail(to: @user.email, subject: 'Your Daily Report')
  end
end
