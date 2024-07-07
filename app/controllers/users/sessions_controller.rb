# frozen_string_literal: true

module Users
  class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        cookies.signed[:auth_token] = { value: user.auth_token, expires: 1.year.from_now }
        # redirect_to root_path
      else
        render json: { errors: { invalid: ['credentials'] } }, status: :unprocessable_entity
      end
    end
  end
end
