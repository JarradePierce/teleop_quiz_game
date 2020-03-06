class QuestionsController < AplicationController

  def index
    @questions = Question.all
  end
end
