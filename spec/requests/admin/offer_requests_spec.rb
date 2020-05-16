require 'rails_helper'

describe 'Admin::Offers', type: :request do
  let(:params) { build(:admin_offer).attributes }
  let!(:offer) { create(:admin_offer) }

  context 'GET #index' do
    let!(:offers) { create_list(:admin_offer, 2) }

    it 'returns http success' do
      get admin_offers_path
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_admin_offer_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_admin_offer_path(offer.id)
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get admin_offers_path(offer)
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    it 'returns redirect http status' do
      put admin_offer_path(offer, admin_offer: params)
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to eq('Offer was successfully updated.')
    end
  end

  describe 'POST #create' do
    it 'redirects to #index on success' do
      expect do
        post admin_offers_path(admin_offer: params)

        expect(response).to have_http_status(:redirect)

        expect(response).to redirect_to(admin_offers_path)
      end.to change { Admin::Offer.count }.by(1)
    end

    it 'renders #new again on failure, with notice' do
      post admin_offers_path(admin_offer: params.merge(description: nil))
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(admin_offers_path)
      expect(response).to_not render_template(:index)
    end
  end

  describe 'DELETE #destroy' do
    it 'set a notice flash with the success message and redirect to index' do
      delete admin_offer_path(offer.id)
      expect(flash[:notice]).to eq('Offer was successfully destroyed.')
      expect(response).to redirect_to(admin_offers_path)
    end
  end

  describe '#disabled' do
    let!(:offer) { create(:admin_offer, :enabled) }
    it 'disabled a offer' do
      post admin_offer_disabled_path(offer), xhr: true
      expect(offer.reload).to be_disabled
      expect(response).to be_successful
    end
  end

  describe '#enabled' do
    let!(:offer) { create(:admin_offer, :disabled) }
    it 'enabled a offer' do
      post admin_offer_enabled_path(offer), xhr: true
      expect(offer.reload).to be_enabled
      expect(response).to be_successful
    end
  end
end
