require 'spec_helper'

RSpec.describe CandidateMailer, type: :mailer do
  let(:host_mail) { 'support@flowup.sn' }

  describe '#subscription' do
    subject(:email) { described_class.subscription(subscription) }

    let(:subscription) { build(:subscription) }

    it 'delivers to candidate email' do
      expect(email).to deliver_to(subscription.email)
    end

    it 'delivers from support@flowup.sn' do
      expect(email).to deliver_from(host_mail)
    end

    it 'has subjet Inscription Flow Up' do
      expect(email).to have_subject('Inscription Flow Up')
    end

    it 'has text Inscription Flow Up' do
      expect(email).to have_body_text('Inscription enregistrée avec succès.')
    end
  end
end
