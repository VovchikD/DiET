# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :authenticate_user!
  helper_method :current_user

  private

  def set_current_user
    if cookies.signed[:auth_token]
      Current.user = User.find_by(auth_token: cookies.signed[:auth_token])
      Rails.logger.info "Current user set: #{Current.user.inspect}"
    else
      Rails.logger.info 'No current user'
    end
  end

  def current_user
    Current.user
  end

  def authenticate_user!
    unless current_user
      redirect_to new_users_session_path unless controller_name == 'sessions' || controller_name == 'accounts'
    end
  end
end
