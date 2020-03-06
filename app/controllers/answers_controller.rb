class AnswersController < AplicationController

  def index
    @answers = Answer.all
  end
end
