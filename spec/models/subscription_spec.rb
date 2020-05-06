# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_presence_of(:tel) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'with attachement' do
    let(:subscription) { create(:subscription) }

    it 'has song attached' do
      expect(subscription.song).to be_attached
    end

    it 'uploads the file' do
      expect { subscription }.to change { ActiveStorage::Attachment.count }.by(1)
    end

    context 'when not valid' do
      it 'is invalid if no file' do
        expect(build(:subscription, song: nil)).not_to be_valid
      end

      it 'is invalid if file type incorrect' do
        expect(
          build(:subscription, song: fixture_file_upload('image.png', 'image/png'))
        ).not_to be_valid
      end
    end
  end
end
