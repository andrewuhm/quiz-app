class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:show, :index]
  
  # GET /questions
  def index
    @questions = Question.all
    # @questions.
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
