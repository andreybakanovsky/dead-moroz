require 'rails_helper'

RSpec.describe '/users', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { get user_path(user) }

    it 'returns the user' do
      expect(json).not_to be_empty
    end

    it 'returns the user with parameters' do
      expect(json['name']).to eq('Henry')
    end

    it 'renders a successful response' do
      get user_path(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          role: 'kid',
          name: 'John',
          age: 13
        }
      end

      it 'creates a new User' do
        expect do
          post users_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'returns the User with parameters' do
        post users_path, params: { user: valid_attributes }
        expect(json['name']).to eq('John')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          role: 'kid',
          name: 'R',
          age: 13
        }
      end

      it 'does not create a new User' do
        expect do
          post users_path, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end

      it 'returns a validation failure message' do
        post users_path, params: { user: invalid_attributes }
        expect(response.body).to include('is too short (minimum is 2 characters)')
      end

      it 'rejects the request' do
        post users_path, params: { user: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          role: 'kid',
          name: 'Sam Hunt',
          age: 13
        }
      end

      it 'updates the requested user' do
        patch user_path(user), params: { user: new_attributes }
        expect(json['name']).to eq('Sam Hunt')
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          role: nil,
          name: 'S',
          age: 13
        }
      end

      before { patch user_path(user), params: { user: new_invalid_attributes } }

      it 'returns a validation failure message' do
        expect(response.body).to include('is too short (minimum is 2 characters)')
      end

      it 'return the current value of the field' do
        expect(user.reload.name).to eq('Henry')
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      expect do
        delete user_path(user)
      end.to change(User, :count).by(-1)
    end

    it 'renders a successful response' do
      delete user_path(user)
      expect(response).to be_successful
    end
  end
end
