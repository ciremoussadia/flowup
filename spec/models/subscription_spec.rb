require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:tel) }
    it { should validate_presence_of(:email) }
  end
end
