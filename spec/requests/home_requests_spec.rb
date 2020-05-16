require 'rails_helper'

describe 'Home', type: :request do
  context 'GET #index' do
    it 'returns http success' do
      get root_path
      expect(response).to be_successful
    end
  end
end
