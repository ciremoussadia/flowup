# frozen_string_literal: true

require 'rails_helper'

describe 'create subscription', type: :request do
  let(:endpoint) { '/subscriptions' }
  let(:subscription_params) { attributes_for(:subscription) }
  subject { post endpoint, params: { subscription: subscription_params } }

  context 'with valid data' do
    it 'saves to db and redirect to home' do
      expect { subject }.to change(Subscription, :count)

      expect(response).to redirect_to root_path
      expect(flash[:success]).to be_present
    end
  end

  context 'with invalid data' do
    let(:subscription_params) { attributes_for(:subscription, name: '') }
    it 'do not save to db and reload form' do
      expect { subject }.to_not change(Subscription, :count)
    end

    it 'reload form' do
      subject
      expect(response.code).to eq('200')
    end
  end
end
