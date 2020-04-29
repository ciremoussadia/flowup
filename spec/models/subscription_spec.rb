require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:tel) }
    it { should validate_presence_of(:email) }
  end

  context 'attachement' do
    let(:subscription) { create(:subscription) }
    it 'should have song attached' do
      expect(subscription.song).to be_attached
    end
    it 'should upload the file' do
      expect { subscription }.to change{ ActiveStorage::Attachment.count }.by(1)
    end

    context 'validations' do
      it 'is invalid if no file' do
        expect(build(:subscription, song: nil)).to_not be_valid
      end
      it 'is invalid if file type incorrect' do
        expect(build(:subscription, song: fixture_file_upload('image.png', 'image/png') )).to_not be_valid
      end
    end
  end
end
