class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question= Question.new
  end

  def create
    q = question.new(question_params)
    if q.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def to_param
    @question.title.parameterize
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end