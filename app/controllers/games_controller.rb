# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @games = Game.not_finished
  end

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json do
        render json: GameSerializer.new(@game, { params: { current_user: current_user } })
      end
    end
  end
end
