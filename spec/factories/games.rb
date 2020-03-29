# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    association :creator, factory: :user
    status { :not_started }
    starting_team { :red }

    trait(:blue) { starting_team { :blue } }
  end
end
