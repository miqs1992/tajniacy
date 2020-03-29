# frozen_string_literal: true

class Tile < ApplicationRecord
  belongs_to :game

  enum tile_type: { neutral: 0, blue: 1, red: 2, bomb: 3 }

  validates :word, uniqueness: { scope: :game_id }, presence: true
end
