require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:user) { create(:user) }

  before { user }

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:user_valid_attributes) do
        {
          user: {
            role: 'kid',
            name: 'John',
            age: 13
          }
        }
      end

      it 'creates a new User' do
        expect { post users_path, params: user_valid_attributes }.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      let(:user_invalid_attributes) do
        {
          user: {
            role: 'kid',
            name: 'R',
            age: 13
          }
        }
      end

      it 'does not create a new User' do
        expect do
          post users_path, params: user_invalid_attributes
        end.not_to change(User, :count)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_user_attributes) do
        {
          user: {
            role: 'kid',
            name: 'Sam Hunt',
            age: 13
          }
        }
      end

      it 'updates the requested user' do
        patch user_path(user), params: new_user_attributes
        expect(user.reload.name).to eq('Sam Hunt')
      end
    end

    context 'with invalid parameters' do
      let(:user_new_invalid_attributes) do
        {
          user: {
            role: nil,
            name: 'S',
            age: 13
          }
        }
      end

      it "does not modify the user's params" do
        patch user_path(user), params: user_new_invalid_attributes
        expect(user.reload.name).to eq('Henry')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      expect do
        delete user_path(user)
      end.to change(User, :count).by(-1)
    end
  end
end
