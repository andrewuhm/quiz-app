class Question < ActiveRecord::Base
  attr_accessible :text
  validates :text, presence: true
  has_many :choices, dependent: :destroy
  
  def answer
    incorrect
    choices.select { |c| c.correct }[0]
  end
  
  def incorrect
    choices.each { |c| c.correct = false }
  end
  
  def answer= choice
    if !answer.nil?
      answer.correct = false
    end
    
    if choices.include? choice
      choice.correct = true
    else
      choices << choice
      choice.correct = true
    end
  end
end
