# frozen_string_literal: true

class GameSerializer < BaseSerializer
  attributes :starting_team, :status

  attribute :tiles do |game, options|
    TileSerializer.new(game.tiles, options).serializable_hash[:data]
  end
end
