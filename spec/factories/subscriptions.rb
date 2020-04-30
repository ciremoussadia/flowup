# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    name { Faker::Artist.name }
    address { Faker::Address.full_address }
    age { Faker::Number.between(18, 45) }
    tel { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    song { fixture_file_upload(Rails.root.join('spec/fixtures/mysong.mp3'), 'audio/mpeg') }
  end
end
