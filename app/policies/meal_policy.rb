# frozen_string_literal: true

class MealPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user.present? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
