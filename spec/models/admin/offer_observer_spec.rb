require 'rails_helper'

RSpec.describe Admin::OfferObserver do
  let(:offer) { build(:admin_offer) }

  subject { described_class.instance }

  context 'when DateTimeOfferStatus' do
    it 'returns enabled' do
      allow(DateTimeOfferStatus).to receive(:call).and_return(:enabled)

      subject.before_save(offer)

      expect(offer).to be_enabled
    end

    it 'returns disabled' do
      allow(DateTimeOfferStatus).to receive(:call).and_return(:disabled)

      subject.before_save(offer)

      expect(offer).to be_disabled
    end
  end

  context 'when status was changed' do
    let(:offer) { build(:admin_offer, :enabled) }

    it 'do not change status by observer' do
      offer.status = :disabled
      allow(DateTimeOfferStatus).to receive(:call).and_return(:enabled)
      allow(offer).to receive(:status_changed?).and_return(true)

      subject.before_save(offer)

      expect(offer).to be_disabled
    end
  end
end
