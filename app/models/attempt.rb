class Attempt < ActiveRecord::Base
	belongs_to :user
	attr_accessible :questions_total, :questions_correct
	validates :user_id, presence: true
end
