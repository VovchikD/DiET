# frozen_string_literal: true

module Requests
  module SessionsHelper
    def signed_cookie
      ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash).signed
    end
  end
end
