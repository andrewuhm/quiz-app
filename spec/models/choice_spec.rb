require 'spec_helper'

describe Choice do
	let(:question) { FactoryGirl.create(:question) }

	before { @choice = question.choices.build(text: "Answer 1", correct: true) }

	subject { @choice }
	it { should respond_to(:text) }
	it { should respond_to(:correct) }
	it { should respond_to(:question) }
	its(:question) { should eq question }

	it { should be_valid }
	
	describe "when question_id is not present" do
	  before { @choice.question_id = nil }
	  it { should_not be_valid }
	end
	
	describe "with blank text" do
	  before { @choice.text = " " }
	  it { should_not be_valid }
	end
	
end
