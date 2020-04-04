# frozen_string_literal: true

require 'rails_helper'

describe 'Games - GET #show' do
  subject(:http_request) { get game_path(game) }

  let(:game) { create(:game) }

  it 'returns a redirect to login' do
    http_request
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'when user is logged in' do
    before { sign_in create(:user) }

    it 'returns a success response' do
      http_request
      expect(response).to have_http_status(:success)
    end
  end
end
