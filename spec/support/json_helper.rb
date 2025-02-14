# frozen_string_literal: true

module JsonHelper
  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
