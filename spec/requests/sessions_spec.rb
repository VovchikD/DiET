# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe '#create' do
    context 'when the request is valid' do
      it 'signs the user' do
        user = create(:user)
        post users_sessions_path, params: { user: { email: user.email, password: user.password } }

        expect(signed_cookie[:auth_token]).to eq(user.auth_token)
      end
    end

    context 'when the request is invalid' do
      it 'does not sign the user' do
        post users_sessions_path, params: { user: { email: 'invalid@example.com', password: 'wrongpassword' } }

        expect(signed_cookie[:auth_token]).to be_nil
      end
    end
  end
end
