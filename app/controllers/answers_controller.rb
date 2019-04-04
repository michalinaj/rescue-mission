class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answer = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save your answer."
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
