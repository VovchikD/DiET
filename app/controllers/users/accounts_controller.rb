# frozen_string_literal: true

module Users
  class AccountsController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        cookies.signed[:auth_token] = { value: user.auth_token, expires: 1.year.from_now }
        # redirect_to root_path
      else
        render json: { errors: user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
