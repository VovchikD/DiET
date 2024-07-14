class Diet < ApplicationRecord
  belongs_to :user
  has_many :diet_meals, dependent: :destroy
  has_many :meals, through: :diet_meals

  validates :name, presence: true
end
