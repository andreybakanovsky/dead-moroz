require 'rails_helper'

RSpec.describe '/reviews', type: :request do
  let(:user) { create(:user) }
  let(:good) { create(:good) }
  let!(:review) { create(:review) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get reviews_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before { get review_path(review) }

    it 'returns the review' do
      expect(json).not_to be_empty
    end

    it 'returns the review with parameters' do
      expect(json['grade']).to eq(8)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          grade: 5,
          comment: 'the valid comment',
          good_id: good.id,
          user_id: user.id
        }
      end

      it 'creates a new Review' do
        expect do
          post reviews_path, params: { review: valid_attributes }
        end.to change(Review, :count).by(1)
      end

      it 'returns the Review with parameters' do
        post reviews_path, params: { review: valid_attributes }
        expect(json['comment']).to eq('the valid comment')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          grade: 12,
          comment: "the valid comment, but the grade isn't valid ",
          good_id: good.id,
          user_id: user.id
        }
      end

      it 'does not create a new Review' do
        expect do
          post reviews_path, params: { review: invalid_attributes }
        end.to change(Review, :count).by(0)
      end

      it 'returns a validation failure message' do
        post reviews_path, params: { review: invalid_attributes }
        expect(response.body).to match(/must be less than or equal to 10/)
      end

      it 'rejects the request' do
        post reviews_path, params: { review: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          grade: 10,
          comment: 'new text',
          good_id: good.id,
          user_id: user.id
        }
      end

      before { patch review_path(review), params: { review: new_attributes } }

      it 'returns the review with parameters' do
        expect(json['comment']).to eq('new text')
      end
    end

    context 'with invalid parameters' do
      let(:new_invalid_attributes) do
        {
          grade: -2.1,
          comment: 'new text',
          good_id: good.id,
          user_id: user.id
        }
      end

      before { patch review_path(review), params: { review: new_invalid_attributes } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/must be an integer/)
      end

      it 'return the current value of the field' do
        expect(review.reload.comment).to eq('some text ... a perfect kid;)')
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested review' do
      expect do
        delete review_path(review)
      end.to change(Review, :count).by(-1)
    end

    it 'renders a successful response' do
      delete review_path(review)
      expect(response).to be_successful
    end
  end
end
