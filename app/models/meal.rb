# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :calories, presence: true
  validates :eaten_at, presence: true
end
