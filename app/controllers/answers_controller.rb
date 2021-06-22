class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def index
    @answers = Answer.all
  end

  def show
    @answer = find_answer
  end

  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html {redirect_to root_path, notice: "created new answer"}
        format.json {render :index, status: :created, location: @answer}
      else
        format.html{redirect_to root_path, notice: "failed to create new answer"}
        format.json{render json: @answer.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @answer = find_answer
    @user = current_user

    respond_to do |format|
      if @answer && @user.id == current_user.id
        @answer.update(answer_params)
        format.html { redirect_to user_answer_path(@answer.user_id, @answer), notice: "Blog updated" }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to user_answer_path(@answer), notice: "update failed" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = find_answer

    if @answer && @user.id == current_user.id
      @answer.destroy!
      redirect_to user_path(@user)
    else
      # format.html { redirect_to user_path(@user), notice: "Blog failed to delete" }
      # format.json { render json: @answer.errors, status: :unprocessable_entity }
      redirect_to "users#show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

end
