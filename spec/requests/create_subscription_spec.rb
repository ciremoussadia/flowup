require 'rails_helper'

describe 'create subscription', type: :request do
  context 'with valid data' do
    it 'saves to db and redirect to home' do
      expect{
        post '/subscriptions', params: {subscription: attributes_for(:subscription)}
      }.to change(Subscription, :count)

      expect(response).to redirect_to root_path
      expect(flash[:success]).to be_present
    end
  end
end