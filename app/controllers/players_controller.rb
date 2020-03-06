class PlayersController < AplicationController

  def index
    @players = player.all
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html {redirect_to root_path, notice: "created new player"}
        format.json {render :index, status: :created, location: @player}
      else
        format.html {redirect_to root_path, notice: 'failded to create player'}
        format.json {render json: @player.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @player = find_player
  end

 private

  def player_params
    params.require(:player).permit(:alias, :points, :game_id)
  end

  def find_player
    @player = Player.find(params[:id])
  end
end
