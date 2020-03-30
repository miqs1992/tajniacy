# frozen_string_literal: true

class GamesUser < ApplicationRecord
  belongs_to :user
  belongs_to :game

  enum team: { red: 'red', blue: 'blue' }

  scope :captains, -> { where(captain: true) }
end
