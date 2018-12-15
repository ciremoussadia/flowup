require 'rails_helper'

describe Subscription do
  context 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:tel) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:song) }
  end
end