require 'rails_helper'

RSpec.describe '/goods', type: :request do
  let(:user) { create(:user) }
  let(:good) { create(:good) }

  before { good }

  describe 'GET /index' do
    it 'renders a successful response' do
      get goods_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { get good_path(good) }

    it 'returns the good' do
      expect(json).not_to be_empty
    end

    it 'returns the good with parameters' do
      expect(json['year']).to eq(2021)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          year: 2020,
          content: 'the valid contents',
          user_id: user.id
        }
      end

      it 'creates a new Good' do
        expect do
          post goods_path, params: { good: valid_attributes }
        end.to change(Good, :count).by(1)
      end

      it 'returns the Good with parameters' do
        post goods_path, params: { good: valid_attributes }
        expect(json['content']).to eq('the valid contents')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          year: 1995,
          content: 'the valid contents',
          user_id: user.id
        }
      end

      it 'does not create a new Good' do
        expect do
          post goods_path, params: { good: invalid_attributes }
        end.to change(Good, :count).by(0)
      end

      it 'returns a validation failure message' do
        post goods_path, params: { good: invalid_attributes }
        expect(response.body).to match(/must be greater than or equal to 2000/)
      end

      it 'rejects the request' do
        post goods_path, params: { good: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          year: 2020,
          content: 'new valid contents',
          user_id: user.id
        }
      end

      before { patch good_path(good), params: { good: new_attributes } }

      it 'returns the good with parameters' do
        expect(json['content']).to eq('new valid contents')
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          year: 2023,
          content: 'new valid contents',
          user_id: user.id
        }
      end

      before { post goods_path, params: { good: new_invalid_attributes } }

      it 'returns a validation failure message' do
        binding pry
        expect(response.body).to match(/must be less than or equal to #{Date.current.year}/)
        expect(response.body).to include("must be less than or equal to #{Date.current.year}") # a variant
      end

      it 'return the current value of the field' do
        expect(good.reload.year).to eq(2021)
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
        expect(response).to have_http_status(:unprocessable_entity) # a variant - delete
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested good' do
      expect do
        delete good_path(good)
      end.to change(Good, :count).by(-1)

      it 'renders a successful response' do
        delete good_path(good)
        expect(response).to be_successful
      end
    end
  end
end
