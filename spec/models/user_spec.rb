require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before { user.save }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:goods).dependent(:destroy) }
    it { is_expected.to have_many(:karmas).dependent(:destroy) }
    it { is_expected.to have_many(:invitations).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_presence_of(:age) }
  end

  describe 'role' do
    it { expect(user.role).to eq('kid') }
  end

  describe 'name' do
    it { expect(user.name).to eq('Henry') }
  end

  describe 'age' do
    it { expect(user.age).to eq(7) }
  end
end
