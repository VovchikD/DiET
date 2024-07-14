# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meals
  resources :diets
  resources :reports, only: %i[index create]

  namespace :users do
    resources :accounts, only: %i[new create]
    resources :sessions, only: %i[new create]
  end
end
