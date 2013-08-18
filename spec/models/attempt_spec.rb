require 'spec_helper'

describe Attempt do

	let(:user) { FactoryGirl.create(:user) }
	before do
	#	@attempt = Attempt.new(questions_total: 20, questions_correct: 15);
		@attempt = user.attempts.build(questions_total: 20, questions_correct: 15);
	end

	subject { @attempt }

	it { should respond_to(:questions_total) }
	it { should respond_to(:questions_correct) }
	it { should respond_to(:user) }
	its(:user) { should eq user }
	
	it { should be_valid }

	describe "when user_id is not present" do
		before { @attempt.user_id = nil }
		it { should_not be_valid }
	end
	
end
