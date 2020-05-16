require 'rails_helper'

RSpec.describe Admin::OffersHelper do
  describe '.status_color' do
    context 'when is enabled' do
      let(:offer) { build(:admin_offer, :enabled) }
      it { expect(helper.status_color(offer)).to eq('is-success') }
    end
    context 'when is disabled' do
      let(:offer) { build(:admin_offer, :disabled) }
      it { expect(helper.status_color(offer)).to eq('is-warning') }
    end
  end

  describe '.switch_path_status' do
    let(:helper_swith_path) { helper.switch_path_resend_email(charge) }

    context 'when staus is enabled' do
      let!(:offer_enabled) { create(:admin_offer, :enabled) }

      it 'return disabled path' do
        expect(helper.switch_path_status(offer_enabled)).to(
          include('disabled')
        )
      end
    end

    context 'when staus is disabled' do
      let!(:offer_disabled) do
        create(:admin_offer, :disabled, ends_at: Time.current - 10.days)
      end

      it 'return enabled path' do
        expect(helper.switch_path_status(offer_disabled)).to(
          include('enabled')
        )
      end
    end
  end
end
