require 'rails_helper'

RSpec.describe Good, type: :model do
  let!(:good) { create(:good) }

  it 'is valid with valid attributes' do
    expect(good).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:child) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:requested_gifts).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_length_of(:content).is_at_most(1000) }

    it { is_expected.to validate_numericality_of(:year).is_greater_than_or_equal_to(2000) }
    it { is_expected.to validate_numericality_of(:year).is_less_than_or_equal_to(Date.current.year) }
  end
end
