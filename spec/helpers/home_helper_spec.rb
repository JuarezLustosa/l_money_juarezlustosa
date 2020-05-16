require 'rails_helper'

RSpec.describe HomeHelper do
  describe '.premium_badger' do
    context 'when is premium' do
      let(:offer) { build(:admin_offer, :premium) }
      it 'return span tag' do
        expect(helper.premium_badger(offer)).to(
          eq("<span class=\"tag is-danger is-rounded topcorner\">Premium</span>")
        )
      end
    end
    context 'when is not a premium' do
      let(:offer) { build(:admin_offer, premium: false) }
      it { expect(helper.premium_badger(offer)).to be_nil }
    end
  end
end
