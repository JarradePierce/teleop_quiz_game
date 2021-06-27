class GamesController < ApplicationController
include SessionsHelper

  def index
    @games = Game.all
    @user = current_user
  end

  def new
    @game = Game.new
    @user = current_user
  end

  def create
    @game = Game.new(game_params)
    @user = current_user

    respond_to do |format|
      if @game.save
        format.html {redirect_to root_path, notice: "created new game"}
        format.json {render :index, status: :created, location: @game}
      else
        format.html{redirect_to root_path, notice: "failed to create new game"}
        format.json{render json: @game.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @game = find_game
  end

  private

  def game_params
    params.require(:game).permit(:info)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
