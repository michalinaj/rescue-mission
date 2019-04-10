class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
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
      flash[:error] = 'Something went wrong.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(params.require(:question).permit(:title, :description))
    if @question.save
      flash[:notice] = 'Article was sucessfully updated.'
      redirect_to @question
    else
      flash[:error] = 'Something went wrong.'
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
