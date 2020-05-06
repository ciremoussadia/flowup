require 'rails_helper'

RSpec.describe CandidateMailer, type: :mailer do
  describe '#subscription' do
    let(:subscription) { build(:subscription) }
    subject(:email) { CandidateMailer.subscription(subscription) }

    it 'delivers to candidate email' do
      is_expected.to deliver_to(subscription.email)
    end
  end
end
