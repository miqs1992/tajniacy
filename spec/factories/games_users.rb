# frozen_string_literal: true

FactoryBot.define do
  factory :games_user do
    user
    game
    team { :red }
    captain { false }

    trait :blue_captain do
      team { :blue }
      captain { true }
    end

    trait :red_captain do
      team { :red }
      captain { true }
    end
  end
end
