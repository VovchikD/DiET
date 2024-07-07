# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "janethebest#{n}@example.com" }
    password { 'secretpassword' }
    sequence(:auth_token) { |n| "secret_token#{n}" }
  end
end
