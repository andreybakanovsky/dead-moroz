require 'rails_helper'

RSpec.describe '/goods', type: :request do
  let(:user) { create(:user) }
  let(:good) { create(:good) }

  before { good }

  describe 'GET /index' do
    it 'renders a successful response' do
      get goods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get good_path(good)
      expect(response).to have_http_status(:success)
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

      it 'updates the requested good' do
        patch good_path(good), params: { good: new_attributes }
        expect(good.reload.content).to eq('new valid contents')
      end
    end

    context 'with invalid parameters' do
      let(:new_attributes) do
        {
          year: 2023,
          content: 'new valid contents',
          user_id: user.id
        }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch good_path(good), params: { good: new_attributes }
        expect(good.reload.year).to eq(2021)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested good' do
      expect do
        delete good_path(good)
      end.to change(Good, :count).by(-1)
    end
  end
end
