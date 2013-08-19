class ChoicesController < ApplicationController
  before_action :admin_user
  
  def create
    @question = Question.find(params[:choice][:question_id])
    @choice = @question.choices.build(choice_params)
    if @choice.correct
      @question.answer = @choice
    end
    
    if @choice.save
      flash[:success] = "Choice created!"
      @question.answer = @choice
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
    # newChoice = Choice.create(text: text, correct: correct, question_id: @question.id)
    
  end

  def destroy
    # @question = Question.find(params[:question])
    @choice = Choice.find_by(id: params[:id])
    @question = Question.find(@choice.question_id)
    @choice.destroy
    redirect_to question_path(@question)
  end
  
  private
    def choice_params
      params.require(:choice).permit(:text, :correct)
    end
  
end
