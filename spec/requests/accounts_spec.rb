# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  let(:valid_attributes) { { email: 'john@example.com', password: 'secretpass' } }
  let(:invalid_attributes) { { email: 'john@example.com', password: '' } }

  describe '#create' do
    context 'when the request is valid' do
      it 'creates the user' do
        expect do
          post users_accounts_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'stores the auth_token in the cookie' do
        post users_accounts_path, params: { user: valid_attributes }

        expect(signed_cookie[:auth_token]).to eq(User.first.auth_token)
      end
    end
  end
end
