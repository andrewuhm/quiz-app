class Choice < ActiveRecord::Base
	belongs_to :question
	attr_accessible :text, :correct
	validates :text, presence: true
	validates :question_id, presence: true
end
