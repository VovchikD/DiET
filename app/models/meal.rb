# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :user
  has_many :diet_meals, dependent: :destroy
  has_many :diets, through: :diet_meals

  validates :name, presence: true
  validates :calories, presence: true
  validates :eaten_at, presence: true
end
