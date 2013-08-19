class QuestionsController < ApplicationController
  before_action :admin_user
  
  # GET /questions
  def index
    @questions = Question.paginate(page: params[:page])
    # @questions.
  end

  def show
    @question = Question.find(params[:id])
    @choices = @question.choices
    @choice = Choice.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created.  Please add choices"
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to @question
    else
      render 'edit'
    end
    
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to(questions_url)
  end
  
  private
    def question_params
      params.require(:question).permit(:text)
    end
end
