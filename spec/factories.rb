FactoryGirl.define do 
	factory :user do
	  sequence(:name)    { |n| "Person #{n}" }
	  sequence(:email)   { |n| "person_#{n}@example.com" }
		password	"foobar"
		password_confirmation "foobar"
		
		factory :admin do
		  admin true
		end
	end

	factory :question do
		question 	"Is this a question?"
	end

	factory :choice do
		text 		"Answer 1"
		correct		true
		question
	end
	
	factory :attempt do
	  questions_correct    15
	  questions_total      20
	  user
	end
end