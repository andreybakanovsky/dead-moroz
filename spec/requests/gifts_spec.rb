require 'rails_helper'

RSpec.describe '/gifts', type: :request do
  let(:good) { create(:good) }
  let(:review) { create(:review) }
  let!(:kid_requested_gift) { create(:gift, :kid_requested) }
  let!(:elf_suggested_gift) { create(:gift, :elf_suggested) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get gifts_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    context 'with a requested gift' do
      before do
        get gift_path(kid_requested_gift)
      end

      it 'returns the gift' do
        expect(json).not_to be_empty
      end

      it 'returns the gift with parameters' do
        expect(json['name']).to eq('a puppy')
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end
    end

    context 'with a suggested gift' do
      before do
        get gift_path(elf_suggested_gift)
      end

      it 'returns the gift' do
        expect(json).not_to be_empty
      end

      it 'returns the gift with parameters' do
        expect(json['name']).to eq('a dog')
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters of requested gift' do
      let(:valid_attributes) do
        {
          name: 'Kingdomino',
          description: 'a pretty kingdomino',
          giftable_type: Good.name,
          giftable_id: good.id
        }
      end

      it 'creates a new Gift' do
        expect do
          post gifts_path, params: { gift: valid_attributes } # !!! gift:
        end.to change(Gift, :count).by(1)
      end

      it 'returns the Gift with parameters' do
        post gifts_path, params: { gift: valid_attributes }
        expect(json['name']).to eq('Kingdomino')
      end
    end

    context 'with invalid parameters of requested gift' do
      let(:invalid_attributes) do
        {
          name: '',
          description: 'a pretty kingdomino',
          giftable_type: Good.name,
          giftable_id: good.id
        }
      end

      it 'does not create a new Gift' do
        expect do
          post gifts_path, params: { gift: invalid_attributes }
        end.to change(Gift, :count).by(0)
      end

      it 'returns a validation failure message' do
        post gifts_path, params: { gift: invalid_attributes }
        expect(response.body).to match(/can't be blank/)
      end

      it 'rejects the request' do
        post gifts_path, params: { gift: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end

    context 'with valid parameters of suggested gift' do
      let(:valid_attributes) do
        {
          name: 'a kingdomino',
          description: 'a pretty kingdomino',
          giftable_type: Review.name,
          giftable_id: review.id
        }
      end

      it 'creates a new Gift' do
        expect do
          post gifts_path, params: { gift: valid_attributes }
        end.to change(Gift, :count).by(1)
      end

      it 'returns the Gift with parameters' do
        post gifts_path, params: { gift: valid_attributes }
        expect(json['name']).to eq('a kingdomino')
      end
    end

    context 'with invalid parameters of suggested gift' do
      let(:invalid_attributes) do
        {
          name: '',
          description: 'a pretty kingdomino',
          giftable_type: Review.name,
          giftable_id: review.id
        }
      end

      it 'does not create a new Gift' do
        expect do
          post gifts_path, params: { gift: invalid_attributes }
        end.to change(Gift, :count).by(0)
      end

      it 'returns a validation failure message' do
        post gifts_path, params: { gift: invalid_attributes }
        expect(response.body).to match(/can't be blank/)
      end

      it 'rejects the request' do
        post gifts_path, params: { gift: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters of requested gift' do
      let(:new_attributes) do
        {
          name: 'a drawing tablet',
          description: 'Graphic drawing tablet with high levels of pressure sensitivity',
          giftable_type: Good.name,
          giftable_id: good.id
        }
      end

      before do
        patch gift_path(kid_requested_gift),
              params: { gift: new_attributes }
      end

      it 'returns the gift with parameters' do
        expect(json['name']).to eq('a drawing tablet')
      end
    end

    context 'with invalid parameters of requested gift' do
      let(:new_invalid_attributes) do
        {
          name: '',
          description: 'some',
          giftable_type: Good.name,
          giftable_id: good.id
        }
      end

      before do
        patch gift_path(kid_requested_gift),
              params: { gift: new_invalid_attributes }
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end

      it 'return the current value of the field' do
        expect(kid_requested_gift.reload.description).to eq('funny and gentle')
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end

    context 'with valid parameters of suggested gift' do
      let(:new_attributes) do
        {
          name: 'a drawing tablet',
          description: 'ok), with high levels of pressure sensitivity',
          giftable_type: Review.name,
          giftable_id: review.id
        }
      end

      before do
        patch gift_path(elf_suggested_gift),
              params: { gift: new_attributes }
      end

      it 'returns the gift with parameters' do
        expect(json['description']).to eq('ok), with high levels of pressure sensitivity')
      end
    end

    context 'with invalid parameters of suggested gift' do
      let(:new_invalid_attributes) do
        {
          name: '',
          description: 'some text',
          giftable_type: Review.name,
          giftable_id: review.id
        }
      end

      before do
        patch gift_path(elf_suggested_gift),
              params: { gift: new_invalid_attributes }
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end

      it 'return the current value of the field' do
        expect(elf_suggested_gift.reload.description).to eq('the puppy, without a name and with a photo')
      end

      it 'rejects the request' do
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with kids requested gift'
    it 'destroys the requested gift' do
      expect do
        delete gift_path(kid_requested_gift)
      end.to change(Gift, :count).by(-1)
    end

    it 'renders a successful response' do
      delete gift_path(kid_requested_gift)
      expect(response).to be_successful
    end
  end

  context 'with elfs suggested gift' do
    it 'destroys the suggested elfs gift' do
      expect do
        delete gift_path(elf_suggested_gift)
      end.to change(Gift, :count).by(-1)
    end

    it 'renders a successful response' do
      delete gift_path(elf_suggested_gift)
      expect(response).to be_successful
    end
  end
end
