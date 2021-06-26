class User < ApplicationRecord
  has_secure_password
  has_many :games

  validates_presence_of :username, :email

  def check_answer(game)
    @answer = game.questions.answers.each do |answer|
      answer.right_answer

      if @answer
        add_points(find_player)
      end
    end
  end

  def add_points(player)
    player.points += 1000
  end

  def find_game
    Game.find(params[:id])
  end

  def find_player
    Player.find(params[:id])
  end
end
