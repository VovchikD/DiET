# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :users do
    resources :accounts, only: %i[create]
    resources :sessions, only: %i[create]
  end
end
