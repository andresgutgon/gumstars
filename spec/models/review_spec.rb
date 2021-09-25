require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'valid rating' do
    let(:product) { create(:product) }
    let(:rating) { 50 }
    subject do
      model = described_class.new(
        product: product,
        rating: rating,
        comment: 'Not bad'
      )
      model.valid?
      model
    end

    it { is_expected.to be_valid }

    context 'not valid rating' do
      let(:rating) { 33 }
      it 'shows validation error' do
        expect(subject.errors.messages[:rating].first)
          .to eq('33 is not a valid rating. You can only put from 1 to 5 stars or half stars')
      end
    end
  end
end
