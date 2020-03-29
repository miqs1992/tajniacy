# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    association :creator, factory: :user
    status { :not_started }
  end
end
