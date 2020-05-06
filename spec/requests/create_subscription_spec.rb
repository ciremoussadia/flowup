# frozen_string_literal: true

require 'rails_helper'

describe 'create subscription', type: :request do
  subject(:create_subscription) { post endpoint, params: { subscription: subscription_params } }

  let(:endpoint) { '/subscriptions' }
  let(:subscription_params) { attributes_for(:subscription) }

  context 'with valid data' do
    it 'saves to db and redirect to home' do
      expect { create_subscription }.to change(Subscription, :count)
    end

    it 'renders flash success' do
      create_subscription
      expect(flash[:success]).to be_present
    end

    it 'redirects to root path' do
      expect(create_subscription).to redirect_to root_path
    end

    it 'sends email to subscriber' do
      ActiveJob::Base.queue_adapter = :test
      expect { create_subscription }.to have_enqueued_mail(CandidateMailer, :subscription)
    end
  end

  context 'with invalid data' do
    let(:subscription_params) { attributes_for(:subscription, name: '') }

    it 'does not save to db' do
      expect { create_subscription }.not_to change(Subscription, :count)
    end

    it 'reloads form' do
      create_subscription
      expect(response.code).to eq('200')
    end
  end
end
