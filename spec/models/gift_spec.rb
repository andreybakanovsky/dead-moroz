require 'rails_helper'

RSpec.describe Gift, type: :model do
  let!(:gift) { create(:gift, :kid_requested) }

  it 'is valid with valid attributes' do
    expect(gift).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:giftable) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  end
end
