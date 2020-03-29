# frozen_string_literal: true

FactoryBot.define do
  factory :tile do
    game
    word { Faker::Lorem.unique.word }
    tile_type { :neutral }

    trait(:blue) { tile_type { :blue } }
    trait(:red) { tile_type { :red } }
    trait(:bomb) { tile_type { :bomb } }
  end
end
