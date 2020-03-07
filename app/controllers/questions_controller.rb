class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(game_params)

    respond_to do |format|
      if @question.save
        format.html {redirect_to root_path, notice: "created new game"}
        format.json {render :index, status: :created, location: @question}
      else
        format.html{redirect_to root_path, notice: "failed to create new question"}
        format.json{render json: @question.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @question = find_question
  end

  private

  def question_params
    params.require(:question).permit(:info)
  end

  def find_game
    @question = Question.find(params[:id])
  end
end
