require 'rails_helper'

RSpec.describe Karma, type: :model do
  let!(:elfs_karma) { create(:karma) }

  it 'is valid with valid attributes' do
    expect(elfs_karma).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:elf) }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
  end
end
