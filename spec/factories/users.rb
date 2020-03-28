# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "mail#{n}@example.com" }
    password { 'password123' }
    name { Faker::Name.name }
  end
end
