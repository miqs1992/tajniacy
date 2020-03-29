# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  enum status: { not_started: 0, started: 1, blue_won: 2, red_won: 3 }

  scope :not_finished, -> { where(status: [0, 1]) }
end
