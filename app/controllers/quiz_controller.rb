class QuizController < ApplicationController
  before_action :signed_in_user
  
  def index
    @max_options = Question.all.count
  end

  def start
    total = params[:number].to_i
    all = Question.find(:all).map { |x| x.id }
    session[:questions] = all.sort_by{ rand }[0..(total - 1)]
    
    session[:total]   = total
    session[:current] = 0
    session[:correct] = 0
    
    redirect_to quiz_question_path
  end

  def question
    @current = session[:current]
    @total   = session[:total]
    
    if @current >= @total
      redirect_to quiz_end_path
      return
    end
    
    @question = Question.find(session[:questions][@current])
    @choices = @question.choices.sort_by{rand}
    
    session[:question] = @question.id
    session[:choices] = @choices.map { |x| x.id }
  end

  def answer
   @current = session[:current]
   @total   = session[:total]
   
   choiceid = params[:choice]
   
   @question = Question.find(session[:question])
   # @choices  = @question.choices
   @choices = session[:choices].map { |x| Choice.find(x) }
   
   @choice = choiceid ? Choice.find(choiceid) : nil
   if @choice and @choice.correct
    @correct = true
    session[:correct] += 1
   else
    @correct = false
   end
   
   session[:current] += 1 
  end

  def end
    @correct = session[:correct]
    @total = session[:total]
    
    @attempt = current_user.attempts.build(questions_total: @total, questions_correct: @correct)
    if @attempt.save
      flash[:success] = "Completed Quiz!"
    end
    @score = @correct * 100 / @total
  end
end
