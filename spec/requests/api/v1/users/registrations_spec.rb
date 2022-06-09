require 'rails_helper'

RSpec.describe '/registrations', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          role: 'kid',
          name: 'John',
          age: 13,
          email: 'user@mail.com',
          password: '123456'
        }
      end

      it 'creates a new User' do
        expect do
          post sign_up_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'returns the User with parameters' do
        post sign_up_path, params: { user: valid_attributes }
        expect(json['name']).to eq('John')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          role: 'kid',
          name: 'R',
          age: 13,
          email: 'mail.com',
          password: '12345'
        }
      end

      it 'does not create a new User' do
        expect do
          post sign_up_path, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end

      it 'returns a validation failure message' do
        post sign_up_path, params: { user: invalid_attributes }
        expect(response.body).to include('is too short (minimum is 2 characters)')
      end

      it 'rejects the request' do
        post sign_up_path, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          role: 'kid',
          name: 'Sam Hunt',
          age: 13,
          email: 'user@mail.com',
          password: '123456'
        }
      end

      before { sign_in user }

      it 'updates the requested user' do
        patch account_update_path, params: { user: new_attributes }
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          role: nil,
          name: 'S',
          age: 13,
          email: 'user@mail.com',
          password: '123456'
        }
      end

      before do
        sign_in user
        patch account_update_path, params: { user: new_invalid_attributes }
      end

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
    before { sign_in user }

    it 'destroys the requested user' do
      expect do
        delete account_delete_path
      end.to change(User, :count).by(-1)
    end

    it 'renders a successful response' do
      delete account_delete_path
      expect(response).to be_successful
    end
  end

  describe 'check invitation befor the registration' do
    let(:token) { SecureRandom.uuid }
    let(:invitation) { create(:invitation) }
    let(:link_params) do
      {
        invitation_id: 4,
        email: 'algar@gmail.com',
        invitation_token: token
      }
    end

    it 'is valid' do
      invitation.digest = BCrypt::Password.create(token)
      invitation.save
      post signup_by_invitation_path(invitation_id: link_params[:invitation_id]), params: link_params
      expect(response).to be_successful
    end
  end

  describe 'POST /create by invitation' do
    let(:token) { SecureRandom.uuid }
    let(:invitation) { create(:invitation) }

    context 'with valid parameters' do
      let(:valid_params) do
        {
          invitation_id: 4,
          email: 'algar@gmail.com',
          invitation_token: token,
          user:         {
            role: 'elf',
         name: 'Algar',
         email: 'algar@gmail.com', # yes, twice
         password: '123456',
         age: 1356
          }
        }
      end

      it 'creates a new User' do
        invitation.digest = BCrypt::Password.create(token)
        invitation.save
        expect do
          post sign_up_path(invitation_id: valid_params[:invitation_id]),
               params: valid_params
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid token' do
      let(:valid_params) do
        {
          invitation_id: 4,
          email: 'algar@gmail.com',
          invitation_token: '0000',
          user:         {
            role: 'elf',
         name: 'Algar',
         email: 'algar@gmail.com', # yes, twice
         password: '123456',
         age: 1356
          }
        }
      end

      it 'creates a new User' do
        invitation.digest = BCrypt::Password.create(token)
        invitation.save
        expect do
          post sign_up_path(invitation_id: valid_params[:invitation_id]),
               params: valid_params
        end.to change(User, :count).by(0)
      end
    end
  end
end
