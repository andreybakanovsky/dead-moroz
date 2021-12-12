require 'rails_helper'

RSpec.describe '/invitations', type: :request do
  let(:dead) { create(:user) }
  let!(:dead_invitation) { create(:invitation) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get invitations_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { get invitation_path(dead_invitation) }

    it 'returns the invitation' do
      expect(json).not_to be_empty
    end

    it 'returns the invitation with parameters' do
      expect(json['email']).to eq('mail@mail.com')
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          email: 'new_mail@mail.com',
          status: 4,
          user_id: dead.id
        }
      end

      it 'creates a new invitation' do
        expect do
          post invitations_path, params: { invitation: valid_attributes }
        end.to change(Invitation, :count).by(1)
      end

      it 'returns the invitation with parameters' do
        post invitations_path, params: { invitation: valid_attributes }
        expect(json['email']).to eq('new_mail@mail.com')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          status: 5,
          user_id: dead.id
        }
      end

      it 'does not create a new invitation' do
        expect do
          post invitations_path, params: { invitation: invalid_attributes }
        end.to change(Invitation, :count).by(0)
      end

      it 'returns a validation failure message' do
        post invitations_path, params: { invitation: invalid_attributes }
        expect(response.body).to match(/must be less than or equal to 4/)
      end

      it 'rejects the request' do
        post invitations_path, params: { invitation: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          email: '3mail@mail.com',
          status: 3,
          user_id: dead.id
        }
      end

      before { patch invitation_path(dead_invitation), params: { invitation: new_attributes } }

      it 'returns the invitation with parameters' do
        expect(json['email']).to eq('3mail@mail.com')
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          status: 5,
          user_id: dead.id
        }
      end

      before { patch invitation_path(dead_invitation), params: { invitation: new_invalid_attributes } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/must be less than or equal to 4/)
      end

      it 'return the current value of the field' do
        expect(dead_invitation.reload.status).to eq(4)
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested invitation' do
      expect do
        delete invitation_path(dead_invitation)
      end.to change(Invitation, :count).by(-1)
    end

    it 'renders a successful response' do
      delete invitation_path(dead_invitation)
      expect(response).to be_successful
    end
  end
end
