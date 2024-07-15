# frozen_string_literal: true

class CreateReportConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :report_configurations do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :daily_reports, null: false, default: false
      t.boolean :weekly_reports, null: false, default: false
      t.boolean :monthly_reports, null: false, default: false

      t.timestamps
    end
  end
end
