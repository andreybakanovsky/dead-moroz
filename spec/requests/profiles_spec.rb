require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /show' do
    before do
      sign_in user
      get profile_path(user)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end
end
