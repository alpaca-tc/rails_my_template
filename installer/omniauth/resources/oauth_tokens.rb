require 'faker'

FactoryGirl.define do
  factory :oauth_token do
    provider { [:twitter].sample }
    uid { Faker::Integer.random(8).to_s }
  end
end
