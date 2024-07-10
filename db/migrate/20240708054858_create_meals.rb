# frozen_string_literal: true

class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :calories
      t.datetime :eaten_at

      t.timestamps
    end
  end
end
