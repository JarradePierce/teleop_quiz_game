class GamesController < AplicationController

  def index
    @games = Game.all
  end
end
