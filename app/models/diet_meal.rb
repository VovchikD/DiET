# frozen_string_literal: true

class DietMeal < ApplicationRecord
  belongs_to :diet
  belongs_to :meal
end
