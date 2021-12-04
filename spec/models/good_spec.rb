require 'rails_helper'

RSpec.describe Good, type: :model do
  let(:user) { create(:user) }
  let(:good) { create(:good) }

  before do
    good.save
    user.save
  end

  it 'is valid with valid attributes' do
    expect(good).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:gifts).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_length_of(:content).is_at_most(500) }

    it { is_expected.to validate_numericality_of(:year).is_greater_than_or_equal_to(2000) }
    it { is_expected.to validate_numericality_of(:year).is_less_than_or_equal_to(Date.current.year) }
  end

  describe 'year' do
    it { expect(good.year).to eq(2021) }
  end

  describe 'content' do
    it { expect(good.content).to eq("I've made many goods this year") }
  end

  describe 'foreign key user_id' do # ??
    it { good.user_id == user.id }
  end
end
