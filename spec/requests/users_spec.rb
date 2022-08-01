# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      user = create(:user)
      get user_url(user)
      expect(response).to be_successful
    end
  end
end
