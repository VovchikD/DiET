# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meals

  namespace :users do
    resources :accounts, only: %i[new create]
    resources :sessions, only: %i[new create]
  end
end
