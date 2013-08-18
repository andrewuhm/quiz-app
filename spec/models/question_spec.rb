require 'spec_helper'

describe Question do

	before { @question = Question.new(question: "Is this a question?") }

	subject { @question }

	it { should respond_to(:question) }
	it { should respond_to(:choices) }
	it { should be_valid }
	
	describe "choice associations" do
		before { @question.save }
		let!(:old_choice) do
			FactoryGirl.create(:choice, question: @question, created_at: 1.day.ago)
		end
		let!(:new_choice) do
			FactoryGirl.create(:choice, question: @question, created_at: 1.hour.ago)
		end

		it "should have the right choices in the right order" do
			expect(@question.choices.to_a).to eq [old_choice, new_choice]
		end

		it "should destroy associated choices" do
			choices = @question.choices.to_a
			@question.destroy
			expect(choices).not_to be_empty
			choices.each do |choice|
				expect(Choice.where(id: choice.id)).to be_empty
			end
		end
	end

end
