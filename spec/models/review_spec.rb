require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:review) { create(:review) }

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:good) }
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:suggested_gifts).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:grade) }
    it { is_expected.to validate_length_of(:comment).is_at_most(1000) }

    it { is_expected.to validate_numericality_of(:grade).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:grade).is_less_than_or_equal_to(10) }
  end
end
