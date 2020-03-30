# frozen_string_literal: true

class TileSerializer < BaseSerializer
  attributes :word, :hit
  attribute :type do |tile, params|
    if params[:current_user]
      tile.tile_type
    else
      :neutral
    end
  end
end
