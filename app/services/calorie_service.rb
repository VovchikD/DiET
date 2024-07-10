# frozen_string_literal: true

require 'faraday'
require 'json'

class CalorieService
  API_URL = 'https://api.calorieninjas.com/v1/nutrition'

  def self.get_calories(food_name)
    encoded_food_name = URI.encode_www_form_component(food_name)
    url = "#{API_URL}?query=#{encoded_food_name}"

    response = Faraday.get(url) do |req|
      req.headers['X-Api-Key'] = Rails.application.credentials.dig(:api, :calorieninjas_api_key)
    end

    data = JSON.parse(response.body)

    return unless data['items']&.any?

    data['items'].first['calories']
  end
end
