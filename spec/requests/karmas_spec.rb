require 'rails_helper'

RSpec.describe '/karmas', type: :request do
  let(:elf) { create(:user) }
  let!(:elfs_karma) { create(:karma) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get karmas_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { get karma_path(elfs_karma) }

    it 'returns the karma' do
      expect(json).not_to be_empty
    end

    it 'returns the karma with parameters' do
      expect(json['value']).to eq(15)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          value: 19,
          user_id: elf.id
        }
      end

      it 'creates a new karma' do
        expect do
          post karmas_path, params: { karma: valid_attributes }
        end.to change(Karma, :count).by(1)
      end

      it 'returns the karma with parameters' do
        post karmas_path, params: { karma: valid_attributes }
        expect(json['value']).to eq(19)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          value: 15.5,
          user_id: elf.id
        }
      end

      it 'does not create a new karma' do
        expect do
          post karmas_path, params: { karma: invalid_attributes }
        end.to change(Karma, :count).by(0)
      end

      it 'returns a validation failure message' do
        post karmas_path, params: { karma: invalid_attributes }
        expect(response.body).to match(/must be an integer/)
      end

      it 'rejects the request' do
        post karmas_path, params: { karma: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          value: 16,
          user_id: elf.id
        }
      end

      before { patch karma_path(elfs_karma), params: { karma: new_attributes } }

      it 'returns the karma with parameters' do
        expect(json['value']).to eq(16)
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          value: -5,
          user_id: elf.id
        }
      end

      before { patch karma_path(elfs_karma), params: { karma: new_invalid_attributes } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/must be greater than or equal to 0/)
      end

      it 'return the current value of the field' do
        expect(elfs_karma.reload.value).to eq(15)
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested karma' do
      expect do
        delete karma_path(elfs_karma)
      end.to change(Karma, :count).by(-1)
    end

    it 'renders a successful response' do
      delete karma_path(elfs_karma)
      expect(response).to be_successful
    end
  end
end
