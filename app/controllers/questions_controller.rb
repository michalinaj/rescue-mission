class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to @question
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
