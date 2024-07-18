# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :meals
  resources :diets
  resources :reports, only: %i[index create] do
    collection do
      get 'report_attributes'
      post 'enable'
    end
  end

  namespace :users do
    resources :accounts, only: %i[new create]
    resources :sessions, only: %i[new create]
  end
end
