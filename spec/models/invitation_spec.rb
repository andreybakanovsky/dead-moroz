require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let!(:dead_invitation) { create(:invitation) }

  it 'is valid with valid attributes' do
    expect(dead_invitation).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:dead_moroz) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }

    it { is_expected.to validate_numericality_of(:status).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:status).is_less_than_or_equal_to(4) }
  end
end
