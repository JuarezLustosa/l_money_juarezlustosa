require 'rails_helper'

RSpec.describe Admin::Offer do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:advertiser_name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }


    context 'validate uri' do
      let(:offer) { build(:admin_offer) }

      it 'invalid url' do
        offer.url = 'ht.//'
        expect(offer.valid?).to be_falsy
      end

      it 'valid url' do
        offer.url = 'https://foo'
        expect(offer.valid?).to be_truthy
      end
    end
  end
end
