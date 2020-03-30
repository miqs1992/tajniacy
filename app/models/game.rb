# frozen_string_literal: true

require 'csv'

class Game < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :tiles, dependent: :delete_all
  has_many :games_users, dependent: :delete_all
  has_many :users, through: :games_users

  after_create :create_tiles

  enum status: { not_started: 0, started: 1, blue_won: 2, red_won: 3, bombed: 4 }
  enum starting_team: { red: 'red', blue: 'blue' }

  scope :not_finished, -> { where(status: [0, 1]) }

  def red_users
    users.merge(GamesUser.red)
  end

  def blue_users
    users.merge(GamesUser.blue)
  end

  def captain_users
    users.merge(GamesUser.captains)
  end

  private

  def create_tiles
    words = CSV.read('lib/words_lists/pl.csv').flatten.shuffle
    create_tile(:bomb, words)
    9.times { create_tile(red? ? :red : :blue, words) }
    8.times { create_tile(red? ? :blue : :red, words) }
    7.times { create_tile(:neutral, words) }
  end

  def create_tile(type, words)
    tiles.create(tile_type: type, word: words.pop)
  end
end
