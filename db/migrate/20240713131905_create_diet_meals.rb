# frozen_string_literal: true

class CreateDietMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :diet_meals do |t|
      t.references :diet, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
