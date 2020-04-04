# frozen_string_literal: true

class GameSerializer < BaseSerializer
  attributes :starting_team, :status

  attribute :tiles do |game, params|
    TileSerializer.new(game.tiles, { params: params }).serializable_hash[:data]
  end
end
