# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    Current.user = User.find_by(auth_token: cookies.signed[:auth_token])
  end
end
