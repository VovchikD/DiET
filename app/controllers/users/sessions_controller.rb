# frozen_string_literal: true

module Users
  class SessionsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = find_by_user

      if valid_user
        cookies.signed[:auth_token] = { value: @user.auth_token, expires: 1.year.from_now }
        redirect_to meals_path
      else
        @user ||= User.new(sign_in_params)
        @user.errors.add(:base, 'Invalid email or password')
        render :new
      end
    end

    def destroy
      cookies.delete(:auth_token)
      # redirect_to root_path
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end

    def valid_user
      @user&.authenticate(params[:user][:password])
    end

    def find_by_user
      User.find_by(email: params[:user][:email])
    end
  end
end
